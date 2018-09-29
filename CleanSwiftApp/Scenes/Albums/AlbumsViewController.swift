//
//  AlbumsViewController.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 13/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit
import RxDataSources
import Presentation
import RxSwift
import RxCocoa

private func configureCellForAlbum(with item: Album,
                           using collectionView: UICollectionView,
                           at indexPath: IndexPath) -> UICollectionViewCell
{
    let cell = collectionView.dequeueReusableCell(AlbumViewCell.self, for: indexPath)
    cell.configureCell(item)
    return cell
}

private func configureCellForPhoto(with item: Photo,
                                   using collectionView: UICollectionView,
                                   at indexPath: IndexPath) -> UICollectionViewCell
{
    let photosCollectionViewLayout = collectionView.collectionViewLayout
        as! UICollectionViewFlowLayout

    let cell = collectionView.dequeueReusableCell(PhotoViewCell.self, for: indexPath)
    // 3 items per row for compact and 6 items per row for regular
    let itemsPerRow: CGFloat = collectionView.traitCollection.verticalSizeClass == .regular ? 3 : 6
    let totalInteritemSpacing = photosCollectionViewLayout.minimumInteritemSpacing * (itemsPerRow - 1)
    let availableWidth = collectionView.frame.width
        - totalInteritemSpacing
        - photosCollectionViewLayout.sectionInset.left
        - photosCollectionViewLayout.sectionInset.right


    cell.setupCellSize(width: floor(availableWidth / itemsPerRow))
    cell.configureCell(item)
    return cell
}

class AlbumsViewController: BaseViewController<AlbumsViewModel> {
    private let albumsCollectionViewDelegate = SelfSizingCollectionViewDelegate<Album, AlbumsSection>(configureCell: configureCellForAlbum)
    private let photosCollectionViewDelegate = SelfSizingCollectionViewDelegate<Photo, PhotoSection>(configureCell: configureCellForPhoto)

    @IBOutlet weak var albumsCollectionView: UICollectionView! {
        didSet {
            albumsCollectionView.delegate = albumsCollectionViewDelegate
        }
    }

    private lazy var albumsDataSource: RxCollectionViewSectionedReloadDataSource = {
        return RxCollectionViewSectionedReloadDataSource<AlbumsSection>(configureCell:
            { (_, collectionView, indexPath, item) -> UICollectionViewCell in
                return configureCellForAlbum(with: item, using: collectionView, at: indexPath)
            })
    }()

    @IBOutlet weak var photosCollectionView: UICollectionView! {
        didSet {
            photosCollectionView.delegate = photosCollectionViewDelegate
        }
    }

    private lazy var photosDataSource: RxCollectionViewSectionedReloadDataSource = {
        return RxCollectionViewSectionedReloadDataSource<PhotoSection>(configureCell:
            { (_, collectionView, indexPath, item) -> UICollectionViewCell in
                configureCellForPhoto(with: item, using: collectionView, at: indexPath)
            })
    }()

    override func bindViewModel() {
        let input = AlbumsViewModel.Input(selectAlbum:
            albumsCollectionView.rx.modelSelected(Presentation.Album.self))

        let output = viewModel.transform(input: input)

        output
            .albums
            .drive(albumsCollectionView.rx.items(dataSource: albumsDataSource))
            .disposed(by: disposeBag)

        output
            .albums
            .asObservable()
            .subscribe(albumsCollectionViewDelegate.sections)
            .disposed(by: disposeBag)

        output
            .photosForSelectedAlbum
            .drive(photosCollectionView.rx.items(dataSource: photosDataSource))
            .disposed(by: disposeBag)

        output
            .photosForSelectedAlbum
            .asObservable()
            .subscribe(photosCollectionViewDelegate.sections)
            .disposed(by: disposeBag)


        output.error.subscribe(onNext: {
            self.showAlert(for: $0)
        }).disposed(by: disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let albumsCollectionViewLayout = albumsCollectionView!.collectionViewLayout
            as! UICollectionViewFlowLayout


        let photosCollectionViewLayout = photosCollectionView.collectionViewLayout
            as! UICollectionViewFlowLayout

        AppStyle.AlbumsViewControllerStyle.apply(albumsCollectionViewFlow: albumsCollectionViewLayout,
                                                 photosCollectionViewFlow: photosCollectionViewLayout)
    }
}

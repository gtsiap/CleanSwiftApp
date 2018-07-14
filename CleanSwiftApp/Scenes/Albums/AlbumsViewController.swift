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
class AlbumsViewController: BaseViewController<AlbumsViewModel> {
    @IBOutlet weak var albumsCollectionView: UICollectionView!
    @IBOutlet weak var albumsCollectionViewLayout: UICollectionViewFlowLayout! {
        didSet {
            albumsCollectionViewLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        }
    }

    private lazy var albumsDataSource: RxCollectionViewSectionedReloadDataSource = {
        return RxCollectionViewSectionedReloadDataSource<AlbumsSection>(configureCell:
            { (_, collectionView, indexPath, item) -> UICollectionViewCell in
                let cell = collectionView.dequeueReusableCell(AlbumViewCell.self, for: indexPath)
                cell.configureCell(item)
                return cell
        })
    }()

    @IBOutlet weak var photosCollectionView: UICollectionView!

    @IBOutlet weak var photosCollectionViewLayout: UICollectionViewFlowLayout! {
        didSet {
            photosCollectionViewLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        }
    }

    private lazy var photosDataSource: RxCollectionViewSectionedReloadDataSource = {
        return RxCollectionViewSectionedReloadDataSource<PhotoSection>(configureCell:
            { (_, collectionView, indexPath, item) -> UICollectionViewCell in
                let cell = collectionView.dequeueReusableCell(PhotoViewCell.self, for: indexPath)

                // 3 items per row
                let itemsPerRow: CGFloat = 3
                let totalInteritemSpacing = self.photosCollectionViewLayout.minimumInteritemSpacing * (itemsPerRow - 1)
                let availableWidth = collectionView.frame.width
                    - totalInteritemSpacing
                    - self.photosCollectionViewLayout.sectionInset.left
                    - self.photosCollectionViewLayout.sectionInset.right

                cell.setupCellSize(width: floor(availableWidth / itemsPerRow))
                cell.configureCell(item)
                return cell
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
            .photosForSelectedAlbum
            .drive(photosCollectionView.rx.items(dataSource: photosDataSource))
            .disposed(by: disposeBag)


        output.error.subscribe(onNext: {
            self.showAlert(for: $0)
        }).disposed(by: disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        AppStyle.AlbumsViewControllerStyle.apply(albumsCollectionViewFlow: albumsCollectionViewLayout,
                                                 photosCollectionViewFlow: photosCollectionViewLayout)
    }
}

//
//  AlbumsViewController.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 13/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

import UIKit
import RxDataSources

class AlbumsViewController: BaseViewController<AlbumsViewModel> {
    @IBOutlet weak var albumsCollectionView: UICollectionView!
    @IBOutlet weak var albumsCollectionViewLayout: UICollectionViewFlowLayout! {
        didSet {
            albumsCollectionViewLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
            albumsCollectionViewLayout.minimumLineSpacing = 10
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

    override func bindViewModel() {
        let output = viewModel.transform(input: AlbumsViewModel.Input())

        output
            .albums
            .drive(albumsCollectionView.rx.items(dataSource: albumsDataSource))
            .disposed(by: disposeBag)

        output.error.subscribe(onNext: {
            self.showAlert(for: $0)
        }).disposed(by: disposeBag)
    }
}

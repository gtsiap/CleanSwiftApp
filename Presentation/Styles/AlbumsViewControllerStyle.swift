//
//  PhotoViewCellStyle.swift
//  Presentation
//
//  Created by Giorgos Tsiapaliokas on 14/07/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

extension AppStyle {
    public struct AlbumsViewControllerStyle {
        public static func apply(albumsCollectionViewFlow: UICollectionViewFlowLayout,
                                 photosCollectionViewFlow: UICollectionViewFlowLayout) {

            photosCollectionViewFlow.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            photosCollectionViewFlow.minimumInteritemSpacing = 10
            photosCollectionViewFlow.minimumLineSpacing = 10

            albumsCollectionViewFlow.minimumInteritemSpacing = 10
        }
    }
}

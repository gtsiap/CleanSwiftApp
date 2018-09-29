//
//  SelfSizingCollectionViewDelegate.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 29/09/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

final class SelfSizingCollectionViewDelegate<Item, Section: SectionModelType>
    : NSObject
    , UICollectionViewDelegateFlowLayout where Section.Item == Item {
    typealias ConfigureCell =  (Item, UICollectionView, IndexPath) -> UICollectionViewCell

    private let disposeBag = DisposeBag()
    private let configureCell: ConfigureCell
    let sections = BehaviorSubject(value: [Section]())

    init(configureCell: @escaping ConfigureCell) {
        self.configureCell = configureCell

        super.init()
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let cell = configureCell(try! sections.value()[indexPath.section].items[indexPath.row],
                                 collectionView, indexPath)
        return cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}

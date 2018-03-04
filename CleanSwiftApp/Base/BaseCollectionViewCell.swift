
//
//  BaseCollectionViewCell.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 15/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

        applyStyle()
    }

    func applyStyle() {
        fatalError("Missing Implementation")
    }
}

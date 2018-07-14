//
//  PhotoViewCell.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 10/03/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit
import Presentation
import Kingfisher

class PhotoViewCell: BaseCollectionViewCell {
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!

    func setupCellSize(width: CGFloat) {
        widthConstraint.constant = width
    }

    func configureCell(_ item: Presentation.Photo) {
        photoView.kf.setImage(with: item.photoURL)
    }

    override func applyStyle() {
    }
}

//
//  AlbumViewCell.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 15/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit
import Presentation

class AlbumViewCell: BaseCollectionViewCell {
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var albumId: UILabel!

    func configureCell(_ item: Presentation.Album) {
        albumTitle.text = item.title
        albumId.text = "Album ID: \(item.id)"
    }

    override func applyStyle() {
        AppStyle.AlbumViewCellStyle.apply(titleLabel: albumTitle,
                                          albumIdLabel: albumId,
                                          contentView: contentView)
    }
}

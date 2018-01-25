//
//  PostViewCell.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit
import Presentation

class PostViewCell: BaseViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!

    func configureCell(_ item: Presentation.Post) {
        titleLabel.text = item.title
        bodyLabel.text = item.description
    }
}

//
//  PostViewCell.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit
import Presentation

class PostViewCell: BaseViewCell<Presentation.Post> {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func configureCell(item: Post) {
        print(item)

        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }

}

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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    func configureCell(_ item: Presentation.Post) {
        titleLabel.text = item.title
        bodyLabel.text = item.description
        nameLabel.text = item.userName
        emailLabel.text = item.userEmail
    }

    override func applyStyle() {
        AppStyle
            .PostViewCellStyle
            .apply(titleLabel: titleLabel,
                   descriptionLabel: bodyLabel,
                   userNameLabel: nameLabel,
                   emailLabel: emailLabel,
                   contentView: contentView)
    }
}

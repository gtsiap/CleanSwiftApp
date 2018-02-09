//
//  PostsViewCell.swift
//  Presentation
//
//  Created by Giorgos Tsiapaliokas on 02/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

extension AppStyle {
    public struct PostViewCellStyle {
        private static let titleStyle = [
            Styles.Label.textColor(textColor: UIColor.black),
            Styles.Label.font(font: UIFont.preferredFont(forTextStyle: .title3))
        ]

        private static let descriptionStyle = [
            Styles.Label.textColor(textColor: UIColor.black.withAlphaComponent(0.8)),
            Styles.Label.font(font: UIFont.preferredFont(forTextStyle: .body))
        ]

        private static let userNameStyle = [
            Styles.Label.font(font: UIFont.preferredFont(forTextStyle: .body)),
            Styles.Label.textColor(textColor: UIColor.lightGray)
        ]

        private static let cellInsets = Styles.View.layoutMargins(insets: Insets(topAndBottom: 10,
                                                                                 leftAndRight: 10))

        private static let emailStyle = userNameStyle

        public static func apply(titleLabel: UILabel,
                                 descriptionLabel: UILabel,
                                 userNameLabel: UILabel,
                                 emailLabel: UILabel,
                                 contentView: UIView) {
            titleStyle.apply(titleLabel)
            descriptionStyle.apply(descriptionLabel)
            userNameStyle.apply(userNameLabel)
            emailStyle.apply(emailLabel)
            cellInsets.apply(view: contentView)
        }
    }
}

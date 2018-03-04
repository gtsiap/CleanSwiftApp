//
//  AlbumViewCell.swift
//  Presentation
//
//  Created by Giorgos Tsiapaliokas on 04/03/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

extension AppStyle {
    public struct AlbumViewCellStyle {
        private static let titleStyle = [
            Styles.Label.textColor(textColor: UIColor.black),
            Styles.Label.font(font: UIFont.preferredFont(forTextStyle: .title3))
        ]

        private static let cellInsets = Styles.View.layoutMargins(insets: Insets(topAndBottom: 10,
                                                                                 leftAndRight: 10))

        private static let border = Styles.View.border(width: 1, color: UIColor.black.withAlphaComponent(0.5))

        private static let cornerRadius = Styles.View.cornerRadius(radius: 10)

        public static func apply(titleLabel: UILabel,
                                 contentView: UIView) {
            titleStyle.apply(titleLabel)
            cellInsets.apply(view: contentView)
            border.apply(view: contentView)
            cornerRadius.apply(view: contentView)
        }
    }
}

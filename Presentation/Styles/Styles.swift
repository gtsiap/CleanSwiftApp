//
//  Styles.swift
//  Presentation
//
//  Created by Giorgos Tsiapaliokas on 02/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

public struct Insets {
    public let topAndBottom: CGFloat
    public let leftAndRight: CGFloat

    public init(topAndBottom: CGFloat, leftAndRight: CGFloat) {
        self.topAndBottom = topAndBottom
        self.leftAndRight = leftAndRight
    }
}

protocol Style {
    associatedtype View: UIView
    func apply(view: View)
}

struct Styles {
    enum Label: Style {
        case textColor(textColor: UIColor)
        case font(font: UIFont)

        func apply(view: UILabel) {
            switch self {
            case .textColor(let textColor):
                view.textColor = textColor
            case .font(let font):
                view.font = font
            }
        }
    }

    enum View: Style {
        case layoutMargins(insets: Insets)
        case border(width: CGFloat, color: UIColor)
        case cornerRadius(radius: CGFloat)

        func apply(view: UIView) {
            switch self {
            case .layoutMargins(let insets):
                if #available(iOS 11.0, *) {
                    view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: insets.topAndBottom,
                                                                            leading: insets.leftAndRight,
                                                                            bottom: insets.topAndBottom,
                                                                            trailing: insets.leftAndRight)
                } else {
                    view.layoutMargins = UIEdgeInsets(top: insets.topAndBottom,
                                                      left: insets.leftAndRight,
                                                      bottom: insets.topAndBottom,
                                                      right: insets.leftAndRight)
                }
            case .border(let width, let color):
                view.layer.borderWidth = width
                view.layer.borderColor = color.cgColor
            case .cornerRadius(let radius):
                view.layer.cornerRadius = radius
            }
        }
    }
}

extension Collection where Element: Style {
    func apply<View>(_ view: View) where Element.View == View {
        forEach({ $0.apply(view: view) })
    }
}

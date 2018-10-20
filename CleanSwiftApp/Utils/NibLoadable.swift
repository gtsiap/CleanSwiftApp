//
//  NibLoadable.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 20/10/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit

protocol NibLoadable {}

extension NibLoadable where Self: UIView {
    static func loadFromNib() -> Self {
        let nib = UINib(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! Self

        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }

}

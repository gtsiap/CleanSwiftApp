//
//  BaseTableViewCell.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit

class BaseViewCell<Item>: UITableViewCell {

    var item: Item! {
        didSet {
            configureCell(item: item)
        }
    }

    func configureCell(item: Item) {

    }
}

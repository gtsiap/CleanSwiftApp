//
//  BaseViewController.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController<ViewModel: AnyObject>: UIViewController {
    let disposeBag = DisposeBag()

    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    func bindViewModel() {

    }
}

//
//  BaseViewController.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit
import RxSwift

protocol ScrollViewContainedHolder {
    var scrollView: UIScrollView { get }
}

class BaseViewController<ViewModel: AnyObject>: UIViewController {
    private lazy var loadingView = PlaceholderLoadingView.loadingView(for: view)
    private let hideLoadingIndicator = PublishSubject<Void>()

    let disposeBag = DisposeBag()

    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadingView.startLoading()

        if let scrollViewContainedHolder = self as? ScrollViewContainedHolder {
            if let tableView = scrollViewContainedHolder.scrollView as? UITableView {
                tableView
                    .rx
                    .willDisplayCell
                    .map({ _ in })
                    .subscribe(hideLoadingIndicator)
                    .disposed(by: disposeBag)
            } else if let collectionView = scrollViewContainedHolder.scrollView as? UICollectionView {
                collectionView
                    .rx
                    .willDisplayCell
                    .map({ _ in })
                    .subscribe(hideLoadingIndicator)
                    .disposed(by: disposeBag)
            } else {
                scrollViewContainedHolder
                    .scrollView
                    .rx.observe(CGSize.self, "contentSize")
                    .distinctUntilChanged()
                    .filter({ $0 == CGSize.zero })
                    .map({ _ in })
                    .subscribe(hideLoadingIndicator)
                    .disposed(by: disposeBag)
            }
        }

        hideLoadingIndicator.subscribe(onNext: { [weak self] in
            guard let `self` = self else { return }
            self.loadingView.stopLoading()
        }).disposed(by: disposeBag)

        bindViewModel()
    }

    func bindViewModel() {
    }
}

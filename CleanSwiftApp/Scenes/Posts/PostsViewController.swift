//
//  PostsViewController.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit
import RxDataSources

class PostsViewController: BaseViewController<PostsViewModel>, ScrollViewContainedHolder {

    var scrollView: UIScrollView { return tableView }

    @IBOutlet weak var tableView: UITableView!

    private lazy var dataSource: RxTableViewSectionedReloadDataSource = {
        return RxTableViewSectionedReloadDataSource<PostsSection>(configureCell:
        { (_, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(PostViewCell.self, for: indexPath)
            cell.configureCell(item)
            return cell
        })
    }()

    override func bindViewModel() {

        let output = viewModel.transform(input: PostsViewModel.Input())

        output
            .posts
            .asObservable()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        output.error.subscribe(onNext: {
            self.showAlert(for: $0)
        }).disposed(by: disposeBag)
    }
}

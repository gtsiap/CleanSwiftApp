//
//  PostsViewController.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit
import RxDataSources

class PostsViewController: BaseViewController<PostsViewModel> {

    @IBOutlet weak var tableView: UITableView!

    private lazy var dataSource: RxTableViewSectionedReloadDataSource = {
        return RxTableViewSectionedReloadDataSource<PostsSection>(configureCell:
        { (_, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(PostViewCell.self, for: indexPath)
            cell.configureCell(item)
            return cell
        })
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func bindViewModel() {
        let output = viewModel.transform(input: PostsViewModel.Input())

        output
            .posts
            .asObservable()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        output.error.subscribe(onNext: {
            let alert = UIAlertController(title: "Error", message: $0.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                alert.dismiss(animated: true)
            }))
            self.present(alert, animated: true)
        }).disposed(by: disposeBag)
    }
}

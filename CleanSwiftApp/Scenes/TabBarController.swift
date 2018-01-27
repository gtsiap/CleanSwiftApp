//
//  TabBarController.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit
import Domain
import data
import Domain

class TabBarController: UITabBarController {
    private var coreDataStack = CoreDataStack.shared

    private lazy var postsRepository: Domain.PostsRepository =
        data.PostsRepository(remoteStore:  RemotePostsStore(coreDataStack: coreDataStack),
                             localStore: LocalPostsStore(coreDataStack: coreDataStack))

    private lazy var fetchPosts = FetchPostsUseCase(postsRepository: postsRepository)

    override func viewDidLoad() {
        super.viewDidLoad()

        let postsVC = UIStoryboard(name: "Posts", bundle: nil)
            .instantiateInitialViewController() as! PostsViewController

        postsVC.viewModel = PostsViewModel(fetchPosts: fetchPosts)

        let postsNV = UINavigationController(rootViewController: postsVC)
        postsNV.tabBarItem = UITabBarItem(title: "Posts", image: nil, selectedImage: nil)

        viewControllers = [
            postsNV,
            UINavigationController(rootViewController: UIViewController())
        ]
    }
}

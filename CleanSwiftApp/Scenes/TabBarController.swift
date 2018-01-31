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
import RxSwift

class TabBarController: UITabBarController {
    private var coreDataStack = CoreDataStack.shared
    private let useCaseScheduler =  ConcurrentDispatchQueueScheduler(qos:
        DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))

    private lazy var postsRepository: Domain.PostsRepository =
        data.PostsRepository(remoteStore:  RemotePostsStore(coreDataStack: coreDataStack),
                             localStore: LocalPostsStore(coreDataStack: coreDataStack))

    private lazy var usersRepository: Domain.UsersRepository =
        data.UsersRepository(remoteStore: RemoteUsersStore(coreDataStack: coreDataStack),
                             localStore: LocalUsersStore(coreDataStack: coreDataStack))

    private lazy var fetchPosts = FetchPostsWithUserUseCase(postsRepository: postsRepository,
                                                            usersRepository: usersRepository,
                                                            scheduler: useCaseScheduler)

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

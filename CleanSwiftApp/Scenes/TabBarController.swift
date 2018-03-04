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
    private let useCaseScheduler =  ConcurrentDispatchQueueScheduler(qos:
        DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))

    private lazy var postsRepository: Domain.PostsRepository = PostsRepositoryFactory.create()

    private lazy var usersRepository: Domain.UsersRepository = UsersRepositoryFactory.create()

    private lazy var fetchPosts = FetchPostsWithUserUseCase(postsRepository: postsRepository,
                                                            usersRepository: usersRepository,
                                                            scheduler: useCaseScheduler)

    private lazy var fetchAlbums = FetchAlbumsUseCase(albumsRepository: AlbumsRepositoryFactory.create(),
                                                      scheduler: useCaseScheduler)

    override func viewDidLoad() {
        super.viewDidLoad()

        let postsVC = UIStoryboard(name: "Posts", bundle: nil)
            .instantiateInitialViewController() as! PostsViewController

        postsVC.viewModel = PostsViewModel(fetchPosts: fetchPosts)
        let postsNV = UINavigationController(rootViewController: postsVC)
        postsNV.tabBarItem = UITabBarItem(title: "Posts", image: nil, selectedImage: nil)

        let albumsVC = UIStoryboard(name: "Albums", bundle: nil)
            .instantiateInitialViewController() as! AlbumsViewController

        albumsVC.viewModel = AlbumsViewModel(fetchAlbums: fetchAlbums)

        let albumsNV = UINavigationController(rootViewController: albumsVC)
        albumsNV.tabBarItem = UITabBarItem(title: "Albums", image: nil, selectedImage: nil)

        viewControllers = [
            postsNV,
            albumsNV
        ]
    }
}

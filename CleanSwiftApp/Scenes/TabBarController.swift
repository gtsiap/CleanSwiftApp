//
//  TabBarController.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let postsVC = UIStoryboard(name: "Posts", bundle: nil)
            .instantiateInitialViewController() as! PostsViewController

        postsVC.viewModel = PostsViewModel()

        let postsNV = UINavigationController(rootViewController: postsVC)
        postsNV.tabBarItem = UITabBarItem(title: "Posts", image: nil, selectedImage: nil)

        viewControllers = [
            postsNV,
            UINavigationController(rootViewController: UIViewController())
        ]
    }
}

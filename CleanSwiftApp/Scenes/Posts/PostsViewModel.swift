//
//  PostsViewModel.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift

protocol PostsViewModelInput {}

protocol PostsViewModelOutput {}

class PostsViewModel {
    struct Input: PostsViewModelInput {}

    struct Output: PostsViewModelOutput {

    }

    func transform(input: PostsViewModelInput) -> PostsViewModelOutput {
        return Output()
    }
}


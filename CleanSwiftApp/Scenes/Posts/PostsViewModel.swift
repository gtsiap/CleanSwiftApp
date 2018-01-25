//
//  PostsViewModel.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift
import Domain
import Presentation
import RxDataSources

typealias PostsSection = SectionModel<String, Presentation.Post>

protocol PostsViewModelInput {}

protocol PostsViewModelOutput {
    var posts: Single<[PostsSection]> { get }
}

class PostsViewModel {
    struct Input: PostsViewModelInput {}

    struct Output: PostsViewModelOutput {
        let posts: Single<[PostsSection]>
    }

    private let fetchPosts: FetchPostsUseCase
    init(fetchPosts: FetchPostsUseCase) {
        self.fetchPosts = fetchPosts
    }

    func transform(input: PostsViewModelInput) -> PostsViewModelOutput {
        let postsSection = fetchPosts
            .execute()
            .map(Presentation.Post.map)
            .map({
                return [PostsSection(model: "posts", items: $0)]
            })

        return Output(posts: postsSection)
    }
}


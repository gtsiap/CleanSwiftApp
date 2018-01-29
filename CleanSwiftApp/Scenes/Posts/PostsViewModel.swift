//
//  PostsViewModel.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift
import RxCocoa
import Domain
import Presentation
import RxDataSources

typealias PostsSection = SectionModel<String, Presentation.Post>

protocol PostsViewModelInput {}

protocol PostsViewModelOutput {
    var posts: Driver<[PostsSection]> { get }
    var error: Observable<Error> { get }
}

class PostsViewModel {
    struct Input: PostsViewModelInput {}

    struct Output: PostsViewModelOutput {
        let posts: Driver<[PostsSection]>
        let error: Observable<Error>
    }

    private let fetchPosts: FetchPostsUseCase

    init(fetchPosts: FetchPostsUseCase) {
        self.fetchPosts = fetchPosts
    }

    func transform(input: PostsViewModelInput) -> PostsViewModelOutput {
        let errorSubject = PublishSubject<Error>()

        let postsSection = fetchPosts
            .execute()
            .map({ return $0.mapToPresentation() })
            .map({
                return [PostsSection(model: "posts", items: $0)]
            }).asDriver { (error) -> Driver<[PostsSection]> in
                errorSubject.onNext(error)
                return Driver.just([PostsSection]())
            }

        return Output(posts: postsSection, error: errorSubject)
    }
}


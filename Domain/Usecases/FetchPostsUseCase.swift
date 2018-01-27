//
//  FetchPosts.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift

public class FetchPostsUseCase: SingleUseCase {
    private let scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))

    private let postsRepository: PostsRepository

    public init(postsRepository: PostsRepository) {
        self.postsRepository = postsRepository
    }

    public func execute() -> Single<[Post]> {
        return postsRepository.fetch().asSingle().subscribeOn(scheduler)
    }
}

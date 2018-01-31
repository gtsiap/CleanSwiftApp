//
//  FetchPosts.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift

public class FetchPostsWithUserUseCase: SingleUseCase<[PostWithUser]> {
    private let postsRepository: PostsRepository
    private let usersRepository: UsersRepository

    public init(postsRepository: PostsRepository,
                usersRepository: UsersRepository,
                scheduler: SchedulerType) {
        self.postsRepository = postsRepository
        self.usersRepository = usersRepository
        super.init(scheduler: scheduler)
    }

    override func singleForUserCase() -> Single<[PostWithUser]> {
        return Single.zip(postsRepository.fetch().asSingle(),
                   usersRepository.fetch().asSingle())
        { (posts, users) -> [PostWithUser] in
            return try posts.map({ post in
                guard let user = users.filter({ return $0.id == post.userId }).first else {
                    throw Error.userNotFound
                }
                return PostWithUser(post: post, user: user)
            })
        }
    }
}

//
//  PostsRepository.swift
//  Data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Domain
import RxSwift

public class PostsRepository: Domain.PostsRepository {
    private let remoteStore: PostsStore
    private let localStore: PostsStore

    public init(remoteStore: PostsStore, localStore: PostsStore) {
        self.remoteStore = remoteStore
        self.localStore = localStore
    }

    public func fetchPosts() -> Observable<[Post]> {
        let fetchPostsFromRemoteAndStoreΤoLocal: Observable<Void> = remoteStore
            .fetchPosts()
            .flatMap(localStore.createPosts)

        let posts: Observable<[PostEntity]> = fetchPostsFromRemoteAndStoreΤoLocal
            .flatMap({

                return self.localStore.fetchPosts()
            })

            return posts.map(PostEntity.map)
    }
}

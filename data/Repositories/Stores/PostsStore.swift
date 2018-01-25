//
//  PostsStore.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift

public protocol PostsStore {
    func fetchPosts() -> Observable<[PostEntity]>
}

public struct RemotePostsStore: PostsStore {
    private let coreDataStack: CoreDataStack
    public init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }

    public func fetchPosts() ->  Observable<[PostEntity]> {
        return NetworkService
            .codable(route: .fetchPosts)
            .map(responseToEntities)
    }

    private func responseToEntities(response: [FetchPostsResponse]) -> [PostEntity] {
        return response.flatMap { (post) -> PostEntity in

            let entity = PostEntity(context:  self.coreDataStack.persistentContainer.viewContext)
            entity.id = Int16(Int32(post.id))
            entity.title = post.title
            entity.desc = post.body
            return entity
        }
    }
}

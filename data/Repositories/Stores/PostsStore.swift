//
//  PostsStore.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift
import CoreData
import Domain

protocol PostsStore: Store where Entity == PostEntity {}

final class RemotePostsStore: PostsStore {
    private let coreDataStack: CoreDataStack
    private let networkService: NetworkServiceType

    init(coreDataStack: CoreDataStack, networkService: NetworkServiceType) {
        self.coreDataStack = coreDataStack
        self.networkService = networkService
    }

   func fetch() ->  Observable<[PostEntity]> {
        return networkService
            .fetchPosts()
            .map(responseToEntities)
    }

    private func responseToEntities(response: [FetchPostsResponse]) -> [PostEntity] {
        return response.flatMap { (post) -> PostEntity in

            let entity = PostEntity(context: self.coreDataStack.backgroundContext)
            entity.id = Int16(post.id)
            entity.title = post.title
            entity.desc = post.body
            entity.userId = Int16(post.userId)
            return entity
        }
    }

    func create(entities: [PostEntity]) -> Single<Void> {
        return Single.just(())
    }
}

final class LocalPostsStore: PostsStore {

    private let coreDataStack: CoreDataStack

    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }

    func fetch() ->  Observable<[PostEntity]> {
        return Observable.deferred({ [unowned self] in
            let result = try self.coreDataStack.mainContext.fetchObjects(PostEntity.self)
            return Observable.just(result)
        })
    }

    func create(entities: [PostEntity]) -> Single<Void> {
        return Single.just(coreDataStack.backgroundContext).map({ moc in
            entities.forEach({
               moc.insert($0)
            })
            try moc.save()
        })
    }
}

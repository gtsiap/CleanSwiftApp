//
//  PostsStore.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift
import CoreData

public protocol PostsStore {
    func fetchPosts() -> Observable<[PostEntity]>
    func createPosts(postEntities: [PostEntity]) -> Single<Void>
}

public class RemotePostsStore: PostsStore {
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
            let entity = PostEntity(context:  self.coreDataStack.backgroundContext)
            entity.id = Int16(Int32(post.id))
            entity.title = post.title
            entity.desc = post.body
            return entity
        }
    }

    public func createPosts(postEntities: [PostEntity]) -> Single<Void> {
        return Single.just(())
    }
}


public class LocalPostsStore: PostsStore {
    private let coreDataStack: CoreDataStack
    public init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }

    public func fetchPosts() ->  Observable<[PostEntity]> {
        return Observable.deferred({ [unowned self] in
            let result = try self.coreDataStack.mainContext.fetchObjects(PostEntity.self)
            return Observable.just(result)
        })
    }

    public func createPosts(postEntities: [PostEntity]) -> Single<Void> {
        return Single.just(coreDataStack.backgroundContext).map({ moc in
            postEntities.forEach({
               moc.insert($0)
            })
            try moc.save()
        })
    }
}

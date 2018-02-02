//
//  PostsReporitoryFactory.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 02/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Domain

public struct PostsRepositoryFactory {
    public static func create() -> Domain.PostsRepository {
        let networkService: NetworkServiceType = NetworkService()
        let coreDataStack = CoreDataStack.shared
        return PostsRepository(remoteStore: RemotePostsStore(coreDataStack: coreDataStack, networkService: networkService),
                               localStore: LocalPostsStore(coreDataStack: coreDataStack))

    }
}

//
//  AlbumsRepositoryFactory.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 15/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Domain

public struct AlbumsRepositoryFactory {
    public static func create() -> Domain.AlbumsRepository {
        let networkService: NetworkServiceType = NetworkService()
        let coreDataStack = CoreDataStack.shared
        return AlbumsRepository(remoteStore: RemoteAlbumsStore(coreDataStack: coreDataStack,
                                                               networkService: networkService),
                               localStore: LocalAlbumsStore(coreDataStack: coreDataStack))

    }
}

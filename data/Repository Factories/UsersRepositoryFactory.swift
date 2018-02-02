//
//  UsersRepositoryFactory.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 02/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Domain

public struct UsersRepositoryFactory {
    public static func create() -> Domain.UsersRepository {
        let networkService: NetworkServiceType = NetworkService()
        let coreDataStack = CoreDataStack.shared
        return UsersRepository(remoteStore: RemoteUsersStore(coreDataStack: coreDataStack, networkService: networkService),
                               localStore: LocalUsersStore(coreDataStack: coreDataStack))

    }
}

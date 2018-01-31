//
//  UsersStore.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 29/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

import RxSwift
import CoreData
import Domain

public protocol UsersStore: Store where Entity == UserEntity {}

public class RemoteUsersStore: UsersStore, RemoteStore {
    private let coreDataStack: CoreDataStack
    private let networkService: NetworkServiceType

    public init(coreDataStack: CoreDataStack, networkService: NetworkServiceType) {
        self.coreDataStack = coreDataStack
        self.networkService = networkService
    }

    public func fetch() -> Observable<[UserEntity]> {
        return networkService
            .fetchUsers()
            .map(dataToCodable)
            .map(responseToEntities)
    }

    private func responseToEntities(response: [FetchUsersResponse]) -> [UserEntity] {
        return response.flatMap { (user) -> UserEntity in
            let entity = UserEntity(context: self.coreDataStack.backgroundContext)
            entity.id = Int16(user.id)
            return entity
        }
    }

    public func create(entities: [UserEntity]) -> Single<Void> {
        return Single.just(())
    }
}

public class LocalUsersStore: UsersStore {
    private let coreDataStack: CoreDataStack
    public init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }

    public func fetch() ->  Observable<[UserEntity]> {
        return Observable.deferred({ [unowned self] in
            let result = try self.coreDataStack.mainContext.fetchObjects(UserEntity.self)
            return Observable.just(result)
        })
    }

    public func create(entities: [UserEntity]) -> Single<Void> {
        return Single.just(coreDataStack.backgroundContext).map({ moc in
            entities.forEach({
                moc.insert($0)
            })
            try moc.save()
        })
    }
}

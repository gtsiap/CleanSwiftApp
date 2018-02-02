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

protocol UsersStore: Store where Entity == UserEntity {}

final class RemoteUsersStore: UsersStore {
    private let coreDataStack: CoreDataStack
    private let networkService: NetworkServiceType

    init(coreDataStack: CoreDataStack, networkService: NetworkServiceType) {
        self.coreDataStack = coreDataStack
        self.networkService = networkService
    }

    func fetch() -> Observable<[UserEntity]> {
        return networkService
            .fetchUsers()
            .map(responseToEntities)
    }

    private func responseToEntities(response: [FetchUsersResponse]) -> [UserEntity] {
        return response.flatMap { (user) -> UserEntity in
            let entity = UserEntity(context: self.coreDataStack.backgroundContext)
            entity.id = Int16(user.id)
            return entity
        }
    }

    func create(entities: [UserEntity]) -> Single<Void> {
        return Single.just(())
    }
}

final class LocalUsersStore: UsersStore {
    private let coreDataStack: CoreDataStack
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }

    func fetch() ->  Observable<[UserEntity]> {
        return Observable.deferred({ [unowned self] in
            let result = try self.coreDataStack.mainContext.fetchObjects(UserEntity.self)
            return Observable.just(result)
        })
    }

    func create(entities: [UserEntity]) -> Single<Void> {
        return Single.just(coreDataStack.backgroundContext).map({ moc in
            entities.forEach({
                moc.insert($0)
            })
            try moc.save()
        })
    }
}

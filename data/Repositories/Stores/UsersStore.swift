//
//  UsersStore.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 29/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift
import CoreData
import Domain


final class RemoteUsersStore: RemoteFetchableStore {
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
            entity.name = user.name
            entity.email = user.email
            return entity
        }
    }
}

final class LocalUsersStore: LocalFetchableStore, LocalCreatableStore {
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

//
//  FetchableRepository.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 27/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Domain
import RxSwift
import CoreData

protocol FetchableRepository: class {
    associatedtype RemoteStore: RemoteFetchableStore where RemoteStore.Entity == Entity
    associatedtype LocalStore: LocalFetchableStore & LocalCreatableStore

    typealias Entity = LocalStore.Entity
    typealias  DomainModel = Entity.DomainModel

    var remoteStore: RemoteStore { get }
    var localStore: LocalStore { get }

    func fetch() -> Observable<[DomainModel]>
}

extension FetchableRepository {
    func fetch() -> Observable<[DomainModel]> {
        return remoteStore
            .fetch()
            .flatMap(localStore.create)
            .flatMap(localStore.fetch)
            .map() {
                return $0.mapToDomain()
            }
    }
}

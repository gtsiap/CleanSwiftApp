//
//  UsersRepository.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 29/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Domain
import RxSwift
import CoreData

final class UsersRepository<R: UsersStore, L: UsersStore>
    : FetchableRepository
    , Domain.UsersRepository
{
    typealias RemoteStore = R
    typealias LocalStore = L
    typealias Entity = UserEntity
    typealias DomainModel = Domain.User

    let remoteStore: R
    let localStore: L

    init(remoteStore: R, localStore: L) {
        self.remoteStore = remoteStore
        self.localStore = localStore
    }
}

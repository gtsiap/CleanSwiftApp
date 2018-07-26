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

final class UsersRepository
    : GenericRepository<RemoteUsersStore, LocalUsersStore>
    , Domain.UsersRepository {
}

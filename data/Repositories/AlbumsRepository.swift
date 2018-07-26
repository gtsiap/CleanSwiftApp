//
//  AlbumsRepository.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 09/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Domain
import RxSwift
import CoreData

final class AlbumsRepository
    : GenericRepository<RemoteAlbumsStore, LocalAlbumsStore>
    , Domain.AlbumsRepository {
}

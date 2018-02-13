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

final class AlbumsRepository<R: AlbumsStore, L: AlbumsStore>
    : FetchableRepository
    , Domain.AlbumsRepository
{
    typealias RemoteStore = R
    typealias LocalStore = L
    typealias Entity = AlbumEntity
    typealias DomainModel = Domain.Album

    let remoteStore: R
    let localStore: L

    init(remoteStore: R, localStore: L) {
        self.remoteStore = remoteStore
        self.localStore = localStore
    }
}

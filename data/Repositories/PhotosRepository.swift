//
//  PhotosRepository.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 12/04/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Domain
import RxSwift
import CoreData

final class PhotosRepository<R: PhotosStore, L: PhotosStore>
    : FetchableRepository
    , Domain.PhotosRepository
{
    typealias RemoteStore = R
    typealias LocalStore = L
    typealias Entity = PhotoEntity
    typealias DomainModel = Domain.Photo

    let remoteStore: R
    let localStore: L

    init(remoteStore: R, localStore: L) {
        self.remoteStore = remoteStore
        self.localStore = localStore
    }
}

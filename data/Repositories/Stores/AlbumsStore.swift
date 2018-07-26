//
//  AlbumsStore.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 09/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import RxSwift

final class RemoteAlbumsStore: RemoteFetchableStore {
    private let coreDataStack: CoreDataStack
    private let networkService: NetworkServiceType

    init(coreDataStack: CoreDataStack, networkService: NetworkServiceType) {
        self.coreDataStack = coreDataStack
        self.networkService = networkService
    }

    func fetch() ->  Observable<[AlbumEntity]> {
        return networkService
            .fetchAlbums()
            .map(responseToEntities)
    }

    private func responseToEntities(response: [FetchAlbumsResponse]) -> [AlbumEntity] {
        return response.flatMap { (album) -> AlbumEntity in

            let entity = AlbumEntity(context: self.coreDataStack.backgroundContext)
            entity.id = Int16(album.id)
            entity.title = album.title
            entity.userId = Int16(album.userId)
            return entity
        }
    }
}

final class LocalAlbumsStore: LocalFetchableStore, LocalCreatableStore {

    private let coreDataStack: CoreDataStack

    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }

    func fetch() ->  Observable<[AlbumEntity]> {
        return Observable.deferred({ [unowned self] in
            let result = try self.coreDataStack.mainContext.fetchObjects(AlbumEntity.self)
            return Observable.just(result)
        })
    }

    func create(entities: [AlbumEntity]) -> Single<Void> {
        return Single.just(coreDataStack.backgroundContext).map({ moc in
            entities.forEach({
                moc.insert($0)
            })
            try moc.save()
        })
    }
}

//
//  PhotosStore.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 12/04/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation


import Foundation
import RxSwift

protocol PhotosStore: Store where Entity == PhotoEntity {}

final class RemotePhotosStore: PhotosStore {
    private let coreDataStack: CoreDataStack
    private let networkService: NetworkServiceType

    init(coreDataStack: CoreDataStack, networkService: NetworkServiceType) {
        self.coreDataStack = coreDataStack
        self.networkService = networkService
    }

    func fetch() ->  Observable<[PhotoEntity]> {
        return networkService
            .fetchPhotos()
            .map(responseToEntities)
    }

    private func responseToEntities(response: [FetchPhotosResponse]) -> [PhotoEntity] {
        return response.flatMap { (photo) -> PhotoEntity in

            let entity = PhotoEntity(context: self.coreDataStack.backgroundContext)
            entity.id = Int16(photo.id)
            entity.albumId = Int16(photo.albumId)
            entity.thumbnailUrl = photo.thumbnailUrl
            return entity
        }
    }

    func create(entities: [PhotoEntity]) -> Single<Void> {
        return Single.just(())
    }
}

final class LocalPhotosStore: PhotosStore {

    private let coreDataStack: CoreDataStack

    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }

    func fetch() ->  Observable<[PhotoEntity]> {
        return Observable.deferred({ [unowned self] in
            let result = try self.coreDataStack.mainContext.fetchObjects(PhotoEntity.self)
            return Observable.just(result)
        })
    }

    func create(entities: [PhotoEntity]) -> Single<Void> {
        return Single.just(coreDataStack.backgroundContext).map({ moc in
            entities.forEach({
                moc.insert($0)
            })
            try moc.save()
        })
    }
}

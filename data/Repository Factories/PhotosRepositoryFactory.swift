//
//  PhotosRepositoryFactory.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 12/04/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Domain

public struct PhotosRepositoryFactory {
    public static func create() -> Domain.PhotosRepository {
        let networkService: NetworkServiceType = NetworkService()
        let coreDataStack = CoreDataStack.shared
        return PhotosRepository(remoteStore: RemotePhotosStore(coreDataStack: coreDataStack,
                                                               fetchRequest: networkService.fetchPhotos),
                                localStore: LocalPhotosStore(coreDataStack: coreDataStack))

    }
}

//
//  FetchPhotosForAlbum.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 10/03/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import RxSwift

public class FetchPhotosForAlbum: SingleUseCaseWithParameter<[Photo], Int> {
    private let photosRepository: PhotosRepository

    public init(photosRepository: PhotosRepository,
                scheduler: SchedulerType) {
        self.photosRepository = photosRepository
        super.init(scheduler: scheduler)
    }

    override func singleForUserCase(parameter: Int) -> Single<[Photo]> {
        return photosRepository.fetch().map({
            return $0.filter({ return $0.albumId == parameter })
        }).asSingle()
    }
}

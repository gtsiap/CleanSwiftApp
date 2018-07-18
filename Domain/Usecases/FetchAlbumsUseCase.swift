//
//  FetchAlbumsUseCase.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 13/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import RxSwift

public class FetchAlbumsUseCase: SingleUseCase<[Album]> {
    private let albumsRepository: AlbumsRepository

    public init(albumsRepository: AlbumsRepository,
                scheduler: SchedulerType) {
        self.albumsRepository = albumsRepository
        super.init(scheduler: scheduler)
    }

    override func singleForUserCase() -> Single<[Album]> {
        return albumsRepository.fetch().asSingle()
    }
}

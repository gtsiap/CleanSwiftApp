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

final class PhotosRepository
    : GenericRepository<RemotePhotosStore, LocalPhotosStore>
    , Domain.PhotosRepository
{
}

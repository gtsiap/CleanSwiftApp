//
//  PostsRepository.swift
//  Data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Domain
import RxSwift
import CoreData

final class PostsRepository
    : GenericRepository<RemotePostsStore, LocalPostsStore>
    , Domain.PostsRepository {
    
}

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

public class PostsRepository<R: PostsStore, L: PostsStore>
    : FetchableRepository
    , Domain.PostsRepository
{
    typealias RemoteStore = R
    typealias LocalStore = L
    typealias Entity = PostEntity
    typealias DomainModel = Domain.Post

    public let remoteStore: R
    public let localStore: L

    public init(remoteStore: R, localStore: L) {
        self.remoteStore = remoteStore
        self.localStore = localStore
    }
}


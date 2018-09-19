//
//  GenericRepository.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 26/07/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

class GenericRepository<R, L>: FetchableRepository
    where
    L.Entity == R.FetchRequestResponse.Entity,
    R: RemoteFetchableStore,
    L: LocalFetchableStore & LocalCreatableStore
{
    typealias RemoteStore = R

    typealias LocalStore = L

    let remoteStore: R
    let localStore: L

    init(remoteStore: R, localStore: L) {
        self.remoteStore = remoteStore
        self.localStore = localStore
    }
}

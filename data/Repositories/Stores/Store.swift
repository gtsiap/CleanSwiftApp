//
//  Store.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 27/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift
import CoreData

protocol RemoteFetchableStore: class {
    associatedtype Entity: DataToDomainMappable
    func fetch() -> Observable<[Entity]>
}

protocol LocalFetchableStore: class {
    associatedtype Entity: DataToDomainMappable
    func fetch() -> Observable<[Entity]>
}


protocol LocalCreatableStore: class {
    associatedtype Entity: DataToDomainMappable
     func create(entities: [Entity]) -> Single<Void>
}

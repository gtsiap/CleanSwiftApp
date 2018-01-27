//
//  Store.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 27/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift
import CoreData

public protocol Store: class {
    associatedtype Entity
    func fetch() -> Observable<[Entity]>
    func create(entities: [Entity]) -> Single<Void>
}

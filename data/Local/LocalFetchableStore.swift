//
//  LocalFetchableStore.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 22/08/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import CoreData
import RxSwift

protocol LocalFetchableStore: class {
    associatedtype Entity: DataToDomainMappable & NSManagedObject
    var fetchableContext: NSManagedObjectContext { get }
}

extension LocalFetchableStore {

    func fetch() ->  Observable<[Entity]> {
        return Observable.deferred({ [unowned self] in
            let result = try self.fetchableContext.fetchObjects(Entity.self)
            return Observable.just(result)
        })
    }

}

protocol LocalCreatableStore: class {
    associatedtype Entity: DataToDomainMappable & NSManagedObject
    var creatableContext: NSManagedObjectContext { get }
}

extension LocalCreatableStore {
    func create(entities: [Entity]) -> Single<Void> {
        return Single.just(creatableContext).map({ moc in
            entities.forEach({
                moc.insert($0)
            })
            try moc.save()
        })
    }
}


final class LocalStore<T: DataToDomainMappable & NSManagedObject>
    : LocalFetchableStore
    , LocalCreatableStore {

    typealias Entity = T

    var fetchableContext: NSManagedObjectContext {
        return coreDataStack.mainContext
    }

    var creatableContext: NSManagedObjectContext {
        return coreDataStack.backgroundContext
    }

    private let coreDataStack: CoreDataStack

    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
}


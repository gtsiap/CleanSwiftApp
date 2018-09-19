//
//  RemoteFetchableStore.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 22/08/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift
import CoreData

protocol RemoteFetchableStore: class {
    associatedtype FetchRequestResponse: NetworkResponseToDataMappable

    var managedObjectContext: NSManagedObjectContext { get }
    var fetchRequest: () -> Observable<[FetchRequestResponse]> { get }
}

extension RemoteFetchableStore {
    func fetch() -> Observable<[FetchRequestResponse.Entity]> {
        return fetchRequest()
            .map(responseToEntities)
    }

    private func responseToEntities(response: [FetchRequestResponse]) -> [FetchRequestResponse.Entity] {
        return response.map { (responseElement) -> FetchRequestResponse.Entity in
            let entity = managedObjectContext.insertNewObject(managedObject: FetchRequestResponse.Entity.self)
            return responseElement.mapToData(entity: entity)
        }
    }
}

final class RemoteStore<T>: RemoteFetchableStore where T: NetworkResponseToDataMappable {
    private let coreDataStack: CoreDataStack

    var managedObjectContext: NSManagedObjectContext {
        return coreDataStack.backgroundContext
    }

    let fetchRequest: (() -> Observable<[T]>)

    init(coreDataStack: CoreDataStack, fetchRequest: @escaping (() -> Observable<[T]>)) {
        self.fetchRequest = fetchRequest
        self.coreDataStack = coreDataStack
    }
}

//
//  CoreDataStack.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    private let persistentContainer: NSPersistentContainer

    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    lazy private(set) var backgroundContext: NSManagedObjectContext = {
        return persistentContainer.newBackgroundContext()
    }()
    
    static let shared = CoreDataStack(isInMemory: false)

    init(isInMemory: Bool) {
        let bundle = Bundle(for: CoreDataStack.self)
        guard let url = bundle.url(forResource: "Model", withExtension: "momd"),
            let model = NSManagedObjectModel(contentsOf: url) else {
                fatalError()
        }

        persistentContainer = NSPersistentContainer(name: "Model", managedObjectModel: model)

        if isInMemory {
            let description = NSPersistentStoreDescription()
            description.type = NSInMemoryStoreType
            persistentContainer.persistentStoreDescriptions = [description]
        }

        persistentContainer.loadPersistentStores() { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
}

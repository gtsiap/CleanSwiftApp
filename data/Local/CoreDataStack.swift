//
//  CoreDataStack.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataStack {
    let persistentContainer: NSPersistentContainer

    public static let shared = CoreDataStack()

    init() {
        let bundle = Bundle(for: CoreDataStack.self)
        guard let url = bundle.url(forResource: "Model", withExtension: "momd"),
            let model = NSManagedObjectModel(contentsOf: url) else {
                fatalError()
        }

        persistentContainer = NSPersistentContainer(name: "Model", managedObjectModel: model)
        persistentContainer.loadPersistentStores() { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
}

//
//  NSManagedObject+Insert.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import CoreData

extension NSManagedObjectContext {
    func insertNewObject<T: NSManagedObject>(managedObject: T.Type) -> T {
        let entityName = String(describing: T.self)
        return NSEntityDescription.insertNewObject(forEntityName: entityName,
                                                   into: self) as! T
    }

    func fetchObjects<T: NSManagedObject>(_ managedObject: T.Type) throws -> [T] {
        let entityName = String(describing: T.self)
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        let result = try fetch(fetchRequest)
        return result
    }
}

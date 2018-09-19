//
//  NetworkResponseToDataMappable.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 29/07/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import CoreData

protocol NetworkResponseToDataMappable {
    associatedtype Entity: DataToDomainMappable & NSManagedObject

    func mapToData(entity: Entity) -> Entity
}

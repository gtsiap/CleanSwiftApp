//
//  FetchUsersResponse+Mappable.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 29/07/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation


extension FetchUsersResponse: NetworkResponseToDataMappable {
    func mapToData(entity: UserEntity) -> UserEntity {
        entity.id = Int16(id)
        entity.name = name
        entity.email = email
        return entity
    }
}

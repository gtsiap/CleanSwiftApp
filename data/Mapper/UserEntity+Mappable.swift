//
//  UserEntity+Mappable.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 29/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import Domain

extension UserEntity: DataToDomainMappable {
    func mapToDomain() -> User {
        return User(id: Int(id), name: name!, email: email!)
    }
}

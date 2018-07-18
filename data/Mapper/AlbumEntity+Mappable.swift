//
//  AlbumEntity+Mappable.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 09/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import Domain

extension AlbumEntity: DataToDomainMappable {
    func mapToDomain() -> Album {
        return Album(id: Int(id), title: title!, userId: Int(userId))
    }
}

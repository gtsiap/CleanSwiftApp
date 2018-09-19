//
//  FetchAlbumsResponse+Mappable.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 22/08/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

extension FetchAlbumsResponse: NetworkResponseToDataMappable {
    func mapToData(entity: AlbumEntity) -> AlbumEntity {
        entity.id = Int16(id)
        entity.title = title
        entity.userId = Int16(userId)
        return entity
    }
}

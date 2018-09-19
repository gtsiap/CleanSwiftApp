//
//  FetchPhotosResponse+Mappable.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 22/08/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

extension FetchPhotosResponse: NetworkResponseToDataMappable {
    func mapToData(entity: PhotoEntity) -> PhotoEntity {
        entity.id = Int16(id)
        entity.albumId = Int16(albumId)
        entity.thumbnailUrl = thumbnailUrl
        return entity
    }
}

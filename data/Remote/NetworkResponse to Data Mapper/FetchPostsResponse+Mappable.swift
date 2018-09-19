//
//  FetchPostsResponse+Mappable.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 22/08/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

extension FetchPostsResponse: NetworkResponseToDataMappable {
    func mapToData(entity: PostEntity) -> PostEntity {
        entity.id = Int16(id)
        entity.title = title
        entity.desc = body
        entity.userId = Int16(userId)
        return entity
    }
}

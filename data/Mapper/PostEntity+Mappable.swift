//
//  PostEntity+Mapper.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import Domain

extension PostEntity: DataToDomainMappable {
    public func mapToDomain() -> Post {
        return Post(id: Int(id),
                    title: title!,
                    description: desc!,
                    userId: Int(userId))
    }
}

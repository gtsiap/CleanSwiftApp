//
//  PostEntity+Mapper.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import Domain

extension PostEntity: DataToDomainMapper {
    static func map(from data: PostEntity) -> Post {

        return Post(id: Int(data.id),
                    title: data.title!,
                    description: data.desc!,
                    userId: Int(data.userId))
    }
}

//
//  Post+Mapper.swift
//  Presentation
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import Domain

extension Post: PresentationToDomainMapper {
    public static func map(from domain: Domain.Post) -> Post {
        return Post(id: domain.id,
                    title: domain.title,
                    description: domain.description)
    }
}

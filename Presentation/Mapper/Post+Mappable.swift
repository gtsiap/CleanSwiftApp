//
//  Post+Mapper.swift
//  Presentation
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import Domain

extension Domain.Post: DomainToPresentationMappable {
    public func mapToPresentation() -> Post {
        return Post(id: id,
                    title: title,
                    description: description)
    }
}

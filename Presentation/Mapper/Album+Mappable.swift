//
//  Album.swift
//  Presentation
//
//  Created by Giorgos Tsiapaliokas on 13/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import Domain

extension Domain.Album: DomainToPresentationMappable {
    public func mapToPresentation() -> Album {
        return Album(id: id,
                    title: title,
                    userId: userId)
    }
}

//
//  Photo+Mappable.swift
//  Presentation
//
//  Created by Giorgos Tsiapaliokas on 10/03/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import Domain

extension Domain.Photo: DomainToPresentationMappable {
    public func mapToPresentation() -> Photo {
        return Photo(id: id, photoURL: thumbnailUrl)
    }
}

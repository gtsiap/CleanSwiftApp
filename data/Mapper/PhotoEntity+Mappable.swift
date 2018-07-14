//
//  PhotoEntity+Mappable.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 12/04/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import Domain

extension PhotoEntity: DataToDomainMappable {
    func mapToDomain() -> Photo {
        return Photo(id: Int(id), albumId: Int(albumId), thumbnailUrl: thumbnailUrl!)
    }
}

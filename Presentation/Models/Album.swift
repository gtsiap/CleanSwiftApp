//
//  Album.swift
//  Presentation
//
//  Created by Giorgos Tsiapaliokas on 13/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import RxDataSources

public struct Album {
    public let id: Int
    public let title: String
    public let userId: Int
}

extension Album: Equatable {
    public static func ==(lhs: Album, rhs: Album) -> Bool {
        return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.userId == rhs.userId
    }

}

extension Album: Hashable {
    public var hashValue: Int { return id }
}

extension Album: IdentifiableType {
    public var identity : Int {
        return id
    }
}

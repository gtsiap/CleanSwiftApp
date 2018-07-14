
//
//  Photo.swift
//  Presentation
//
//  Created by Giorgos Tsiapaliokas on 10/03/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import RxDataSources

public struct Photo {
    public let id: Int
    public let photoURL: URL

    public init(id: Int, photoURL: URL) {
        self.id = id
        self.photoURL = photoURL
    }
}

extension Photo: Equatable {
    public static func ==(lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Photo: Hashable {
    public var hashValue: Int { return id }
}

extension Photo: IdentifiableType {
    public var identity : Int {
        return id
    }
}

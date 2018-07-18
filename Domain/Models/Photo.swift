//
//  Photo.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 10/03/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

public struct Photo {
    public let id: Int
    public let albumId: Int
    public let thumbnailUrl: URL

    public init(id: Int, albumId: Int, thumbnailUrl: URL) {
        self.id = id
        self.albumId = albumId
        self.thumbnailUrl = thumbnailUrl
    }
}

//
//  Album.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 09/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

public struct Album {
    public let id: Int
    public let title: String
    public let userId: Int

    public init(id: Int,
                title: String,
                userId: Int)
    {
        self.id = id
        self.title = title
        self.userId = userId
    }
}

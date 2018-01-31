//
//  User.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

public struct User {
    public let id: Int
    public let avatar: URL

    public init(id: Int, avatar: URL) {
        self.id = id
        self.avatar = avatar
    }
}

//
//  User.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

public struct User {
    public let id: Int
    public let name: String
    public let email: String

    public init(id: Int, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}

//
//  Post.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

public struct Post {
    public let id: Int
    public let title: String
    public let description: String
    public let userId: Int

    public init(id: Int,
                title: String,
                description: String,
                userId: Int)
    {
        self.id = id
        self.title = title
        self.description = description
        self.userId = userId
    }
}

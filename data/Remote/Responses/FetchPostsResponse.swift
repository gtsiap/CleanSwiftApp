//
//  FetchPostsResponse.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

struct FetchPostsResponse: Codable {
    struct Post: Codable {
        let userId: Int
        let title: String
        let description: String
    }

    let posts: [Post]
}

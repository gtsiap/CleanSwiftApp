//
//  FetchAlbumsResponse.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 09/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

struct FetchAlbumsResponse: Codable {
    let id: Int
    let userId: Int
    let title: String
}

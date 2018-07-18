//
//  FetchPhotosResponse.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 12/04/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

struct FetchPhotosResponse: Codable {
    let id: Int
    let albumId: Int
    let thumbnailUrl: URL
}

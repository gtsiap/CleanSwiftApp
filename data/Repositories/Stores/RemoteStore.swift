//
//  RemoteStore.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 31/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import RxSwift

protocol RemoteStore {}

extension RemoteStore {
    func dataToCodable<T: Codable>(data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}


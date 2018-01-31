//
//  Error.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 31/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

enum Error: LocalizedError {
    case userNotFound

    var errorDescription: String? {
        switch self {
        case .userNotFound:
            return "User Not Found"
        }
    }
}

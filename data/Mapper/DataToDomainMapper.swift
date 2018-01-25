//
//  DataToDomainMapper.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

protocol DataToDomainMapper {
    associatedtype DataModel
    associatedtype DomainModel

    static func map(from data: DataModel) -> DomainModel
}

extension DataToDomainMapper {
    static func map(from data: [DataModel]) -> [DomainModel] {
        return data.map(Self.map)
    }
}

//
//  Mapper.swift
//  Presentation
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

public protocol PresentationToDomainMapper {
    associatedtype DomainModel
    associatedtype PresentationModel

    static func map(from domain: DomainModel) -> PresentationModel
}

extension PresentationToDomainMapper {
    public static func map(from domain: [DomainModel]) -> [PresentationModel] {
        return domain.map(Self.map)
    }
}

//
//  DataToDomainMapper.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

protocol DataToDomainMappable {
    associatedtype DomainModel

    func mapToDomain() -> DomainModel
}

extension Sequence where Iterator.Element: DataToDomainMappable {
    func mapToDomain() -> [Element.DomainModel] {
        return map { (element) -> Element.DomainModel in
            return element.mapToDomain()
        }
    }
}

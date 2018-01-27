//
//  Mapper.swift
//  Presentation
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

public protocol DomainToPresentationMappable {
    associatedtype PresentationModel

    func mapToPresentation() -> PresentationModel
}

extension Sequence where Iterator.Element: DomainToPresentationMappable {
    public func mapToPresentation() -> [Element.PresentationModel] {
        return map { (element) -> Element.PresentationModel in
            return element.mapToPresentation()
        }
    }
}


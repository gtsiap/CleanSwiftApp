//
//  MockedRepository.swift
//  DomainTests
//
//  Created by Giorgos Tsiapaliokas on 02/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift

class MockedRepository<T> {
    private let objects: [T]

    init(_ objects: [T]) {
        self.objects = objects
    }

    func fetch() -> Observable<[T]> {
        return Observable.just(objects)
    }
}

//
//  DomainTests.swift
//  DomainTests
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift
import RxBlocking
import XCTest
@testable import Domain

class DomainTestCase: XCTestCase {

    let scheduler = MainScheduler.instance

    func assertObservable<E>(single: Single<E>, numberOfElements: Int) throws -> E {
        return try assertObservable(observable: single.asObservable(), numberOfElements: numberOfElements)
    }

    func assertObservable<E>(observable: Observable<E>, numberOfElements: Int) throws -> E {
        let observableSequence = try observable.toBlocking().toArray()
        XCTAssertEqual(observableSequence.count, numberOfElements)

        let results = observableSequence.first
        XCTAssertNotNil(results)

        return results!
    }
    
}

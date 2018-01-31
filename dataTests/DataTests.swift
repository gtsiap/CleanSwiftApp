//
//  DataTests.swift
//  DataTests
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift
import RxBlocking

import XCTest
@testable import data

class DataTestCase: XCTestCase {
    var coreDataStack: CoreDataStack!

    override func setUp() {
        super.setUp()
        coreDataStack = CoreDataStack(isInMemory: true)
    }
    
    func assertObservable<E>(observable: Observable<E>, numberOfElements: Int) throws -> E {
        let observableSequence = try observable.toBlocking().toArray()
        XCTAssertEqual(observableSequence.count, numberOfElements)

        let results = observableSequence.first
        XCTAssertNotNil(results)

        return results!
    }
}

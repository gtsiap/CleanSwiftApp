//
//  UsersRepositoryTests.swift
//  DataTests
//
//  Created by Giorgos Tsiapaliokas on 31/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import XCTest
import RxSwift
import RxBlocking
import Domain
@testable import data

class MockedNetworkService: NetworkServiceType {
    func fetchUsers() -> Observable<Data> {
        let mocked = """
[{
    "id" : 5
}]
"""
        return Observable.just(mocked.data(using: .utf8)!)
    }
}

class UsersRepositoryTests: DataTestCase {
    private let mockedNetworkService = MockedNetworkService()

    func testIfUserExists() throws {
        let localStore = LocalUsersStore(coreDataStack: coreDataStack)
        let remoteStore = RemoteUsersStore(coreDataStack: coreDataStack, networkService: mockedNetworkService)

        let repository = UsersRepository(remoteStore: remoteStore, localStore: localStore)

        let users = try assertObservable(observable: repository.fetch(), numberOfElements: 1)

        let user = users.first
        XCTAssertNotNil(user)

        XCTAssertEqual(user!.id, 5)
    }
}

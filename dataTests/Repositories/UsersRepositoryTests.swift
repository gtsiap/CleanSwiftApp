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

private struct MockedNetworkService: NetworkServiceType {
    func fetchUsers() -> Observable<[FetchUsersResponse]> {
        let stub = """
[{
    "id" : 5,
    "name": "John",
    "email": "Smith"
}]
"""
        return stubToCodable(stub: stub)
    }
}

class UsersRepositoryTests: DataTestCase {
    private let mockedNetworkService = MockedNetworkService()

    func testIfUserExists() throws {
        let localStore = LocalUsersStore(coreDataStack: coreDataStack)
        let remoteStore = RemoteUsersStore(coreDataStack: coreDataStack,
                                           fetchRequest: mockedNetworkService.fetchUsers)

        let repository = UsersRepository(remoteStore: remoteStore, localStore: localStore)

        let users = try assertObservable(observable: repository.fetch(), numberOfElements: 1)

        let user = users.first
        XCTAssertNotNil(user)

        XCTAssertEqual(user!.id, 5)
        XCTAssertEqual(user!.name, "John")
        XCTAssertEqual(user!.email, "Smith")
    }
}

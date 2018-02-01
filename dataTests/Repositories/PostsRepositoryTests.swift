//
//  PostsRepositoryTests.swift
//  dataTests
//
//  Created by Giorgos Tsiapaliokas on 01/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import XCTest
import RxSwift
import RxBlocking
import Domain
@testable import data

private class MockedNetworkService: NetworkServiceType {
    func fetchPosts() -> Observable<Data> {
        let mocked = """
[{
    "id" : 5,
    "userId": 5,
    "title": "title",
    "body": "body"
}]
"""
        return Observable.just(mocked.data(using: .utf8)!)
    }
}

class PostsRepositoryTests: DataTestCase {
    private let mockedNetworkService = MockedNetworkService()

    func testIfPostExists() throws {
        let localStore = LocalPostsStore(coreDataStack: coreDataStack)
        let remoteStore = RemotePostsStore(coreDataStack: coreDataStack, networkService: mockedNetworkService)

        let repository = PostsRepository(remoteStore: remoteStore, localStore: localStore)

        let posts = try assertObservable(observable: repository.fetch(), numberOfElements: 1)

        let post = posts.first
        XCTAssertNotNil(post)

        XCTAssertEqual(post!.id, 5)
        XCTAssertEqual(post!.userId, 5)
        XCTAssertEqual(post!.title, "title")
        XCTAssertEqual(post!.description, "body")
    }
}

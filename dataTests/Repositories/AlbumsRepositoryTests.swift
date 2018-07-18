//
//  AlbumsRepositoryTests.swift
//  dataTests
//
//  Created by Giorgos Tsiapaliokas on 13/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import XCTest
import RxSwift
import RxBlocking
import Domain
@testable import data

private struct MockedNetworkService: NetworkServiceType {
    func fetchAlbums() -> Observable<[FetchAlbumsResponse]> {
        let stub = """
[{
    "id" : 1,
    "userId": 1,
    "title": "title"
}]
"""
        return stubToCodable(stub: stub)
    }
}

class AlbumsRepositoryTests: DataTestCase {
    private let mockedNetworkService = MockedNetworkService()

    func testIfAlbumExists() throws {
        let localStore = LocalAlbumsStore(coreDataStack: coreDataStack)
        let remoteStore = RemoteAlbumsStore(coreDataStack: coreDataStack, networkService: mockedNetworkService)

        let repository = AlbumsRepository(remoteStore: remoteStore, localStore: localStore)

        let albums = try assertObservable(observable: repository.fetch(), numberOfElements: 1)

        let album = albums.first
        XCTAssertNotNil(album)

        XCTAssertEqual(album!.id, 1)
        XCTAssertEqual(album!.userId, 1)
        XCTAssertEqual(album!.title, "title")
    }
}

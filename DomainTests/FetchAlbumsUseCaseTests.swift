//
//  FetchAlbumsUseCaseTests.swift
//  DomainTests
//
//  Created by Giorgos Tsiapaliokas on 13/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift
import RxBlocking
import Foundation
import XCTest
@testable import Domain

private class MockedAlbumsRepository: MockedRepository<Album>, AlbumsRepository {}

class FetchAlbumsUseCaseTests: DomainTestCase {
    private let albums = [Album(id: 1, title: "title", userId: 1)]

    func testIfAlbumIsCorrect() throws {
        let fetchAlbums = FetchAlbumsUseCase(albumsRepository: MockedAlbumsRepository(albums),
                                             scheduler: scheduler)


        let album = try assertObservable(single: fetchAlbums.execute(), numberOfElements: 1).first
        XCTAssertNotNil(album)

        XCTAssertEqual(album!.id, 1)
        XCTAssertEqual(album!.title, "title")
        XCTAssertEqual(album!.userId, 1)
    }
}

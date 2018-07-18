//
//  FetchPhotosForAlbumTests.swift
//  DomainTests
//
//  Created by Giorgos Tsiapaliokas on 18/07/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

import RxSwift
import RxBlocking
import Foundation
import XCTest
@testable import Domain

private class MockedPhotosRepository: MockedRepository<Photo>, PhotosRepository {}

class FetchPhotosForAlbumUsecaseTests: DomainTestCase {
    private let photos = [Photo(id: 1, albumId: 1, thumbnailUrl: URL(string: "http://placehold.it/150/771796")!)]

    func testIfPhotosAreCorrect() throws {
        let fetchPhotosForAlbum = FetchPhotosForAlbum(photosRepository: MockedPhotosRepository(photos),
                                                      scheduler: scheduler)


        let photo = try assertObservable(single: fetchPhotosForAlbum.execute(parameter: 1),
                                         numberOfElements: 1).first
        XCTAssertNotNil(photo)

        XCTAssertEqual(photo!.id, 1)
        XCTAssertEqual(photo!.albumId, 1)
        XCTAssertEqual(photo!.thumbnailUrl, URL(string: "http://placehold.it/150/771796"))
    }
}

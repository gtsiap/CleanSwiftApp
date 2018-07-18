//
//  PhotosRepositoryTests.swift
//  dataTests
//
//  Created by Giorgos Tsiapaliokas on 18/07/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation


import XCTest
import RxSwift
import RxBlocking
import Domain
@testable import data

private struct MockedNetworkService: NetworkServiceType {
    func fetchPhotos() -> Observable<[FetchPhotosResponse]> {
        let stub = """
[{
    "id" : 1,
    "albumId": 1,
    "thumbnailUrl": "http://placehold.it/150/771796"
}]
"""
        return stubToCodable(stub: stub)
    }
}

class PhotosRepositoryTests: DataTestCase {
    private let mockedNetworkService = MockedNetworkService()

    func testIfPhotoExists() throws {
        let localStore = LocalPhotosStore(coreDataStack: coreDataStack)
        let remoteStore = RemotePhotosStore(coreDataStack: coreDataStack, networkService: mockedNetworkService)

        let repository = PhotosRepository(remoteStore: remoteStore, localStore: localStore)

        let photos = try assertObservable(observable: repository.fetch(), numberOfElements: 1)

        let photo = photos.first
        XCTAssertNotNil(photo)

        XCTAssertEqual(photo!.id, 1)
        XCTAssertEqual(photo!.albumId, 1)
        XCTAssertEqual(photo!.thumbnailUrl, URL(string: "http://placehold.it/150/771796"))
    }
}

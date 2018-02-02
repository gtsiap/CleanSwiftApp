//
//  FetchPostsWithUserUseCaseTests.swift
//  DomainTests
//
//  Created by Giorgos Tsiapaliokas on 02/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift
import RxBlocking
import Foundation
import XCTest
@testable import Domain

private class MockedPostsRepository: MockedRepository<Post>, PostsRepository {}
private class MockedUsersRepository: MockedRepository<User>, UsersRepository {}

class FetchPostsWithUserUseCaseTests: DomainTestCase {
    private let validPosts = [Post(id: 5, title: "title",
                                   description: "description",
                                   userId: 5)]

    private let validUsers = [User(id: 5)]

    func testIfUserIsCorrect() throws {

        let fetchPostsWithUser = FetchPostsWithUserUseCase(postsRepository: MockedPostsRepository(validPosts),
                                                           usersRepository: MockedUsersRepository(validUsers),
                                                           scheduler: scheduler)


        let postWitchUser = try assertObservable(single: fetchPostsWithUser.execute(), numberOfElements: 1).first
        XCTAssertNotNil(postWitchUser)

        XCTAssertEqual(postWitchUser!.post.id, 5)
        XCTAssertEqual(postWitchUser!.user.id, 5)
    }

    func testUserDoesNotExist() {
        let fetchPostsWithUser = FetchPostsWithUserUseCase(postsRepository: MockedPostsRepository(validPosts),
                                                           usersRepository: MockedUsersRepository([User]()),
                                                           scheduler: scheduler)

        XCTAssertThrowsError(try fetchPostsWithUser.execute().toBlocking().toArray())
    }

    func testNoPosts() {
        let fetchPostsWithUser = FetchPostsWithUserUseCase(postsRepository: MockedPostsRepository([Post]()),
                                                           usersRepository: MockedUsersRepository(validUsers),
                                                           scheduler: scheduler)

        XCTAssertTrue(try assertObservable(single: fetchPostsWithUser.execute(), numberOfElements: 1).isEmpty)
    }
}

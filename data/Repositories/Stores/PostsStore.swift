//
//  PostsStore.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift

protocol PostsStore {
    func fetchPosts() -> Observable<Void>
}

struct RemotePostsStore {
    func fetchPosts() -> Observable<FetchPostsResponse> {
        return NetworkService.codable(route: .fetchPosts)
    }
}

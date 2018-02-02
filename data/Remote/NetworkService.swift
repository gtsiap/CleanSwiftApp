//
//  NetworkService.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol NetworkServiceType {
    func fetchPosts() -> Observable<[FetchPostsResponse]>
    func fetchUsers() -> Observable<[FetchUsersResponse]>
}

extension NetworkServiceType {
    func fetchPosts() -> Observable<[FetchPostsResponse]> {
        return codable(route: .fetchPosts)
    }

    func fetchUsers() -> Observable<[FetchUsersResponse]> {
        return codable(route: .fetchUsers)
    }

    private func codable<T: Codable>(route: Route) -> Observable<T>  {
       return data(route: route)
        .map({ return try JSONDecoder().decode(T.self, from: $0) })
    }

    private func data(route: Route) -> Observable<Data> {
        return URLSession.shared.rx.data(request: route.urlRequest())
    }
}

struct NetworkService: NetworkServiceType {
    init() {}
}

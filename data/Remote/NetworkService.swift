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

public protocol NetworkServiceType {
    func fetchPosts() -> Observable<Data>
    func fetchUsers() -> Observable<Data>
}

extension NetworkServiceType {
    public func fetchPosts() -> Observable<Data> {
        return data(route: .fetchPosts)
    }

    public func fetchUsers() -> Observable<Data> {
        return data(route: .fetchUsers)
    }

    private func data(route: Route) -> Observable<Data> {
        return URLSession.shared.rx.data(request: route.urlRequest())
    }
}

public struct NetworkService: NetworkServiceType {
    public init() {}
}

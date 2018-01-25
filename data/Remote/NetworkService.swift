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

struct NetworkService {
    static func data(route: Route) -> Observable<Data> {
        return URLSession.shared.rx.data(request: route.urlRequest())
    }

    static func codable<T: Codable>(route: Route) -> Observable<T> {
        return NetworkService.data(route: route).map({ (data: Data) -> T in
            return try JSONDecoder().decode(T.self, from: data)
        })
    }
}

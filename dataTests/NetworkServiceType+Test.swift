//
//  NetworkServiceType+Test.swift
//  dataTests
//
//  Created by Giorgos Tsiapaliokas on 02/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import RxSwift
@testable import data

extension NetworkServiceType {
    func stubToCodable<T: Codable>(stub: String) -> Observable<T> {
        return Observable.just(stub)
            .map({ return $0.data(using: .utf8)! })
            .map({ return try JSONDecoder().decode(T.self, from: $0) } )
    }
}

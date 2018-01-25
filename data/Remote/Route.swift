//
//  Route.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

enum Route {
    private static let baseURL = URL(string: "https://jsonplaceholder.typicode.com/")!
    struct RequestFactory {
        enum Method: String {
            case get = "GET"
        }

        let path: String
        let method: Method

        func urlRequest() -> URLRequest {
            var url = baseURL
            url.appendPathComponent(path)

            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            return request
        }
    }

    case fetchPosts

    func urlRequest() -> URLRequest {
        return RequestFactory(path: "posts", method: .get).urlRequest()
    }
}
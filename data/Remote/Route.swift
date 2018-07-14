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
    case fetchUsers
    case fetchAlbums
    case fetchPhotos
    
    func urlRequest() -> URLRequest {
        switch self {
        case .fetchPosts:
            return RequestFactory(path: "posts", method: .get).urlRequest()
        case .fetchUsers:
            return RequestFactory(path: "users", method: .get).urlRequest()
        case .fetchAlbums:
            return RequestFactory(path: "albums", method: .get).urlRequest()
        case .fetchPhotos:
            return RequestFactory(path: "photos", method: .get).urlRequest()
        }
    }
}

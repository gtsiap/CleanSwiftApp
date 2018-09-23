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
    private struct Request {
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
            return Request(path: "posts", method: .get).urlRequest()
        case .fetchUsers:
            return Request(path: "users", method: .get).urlRequest()
        case .fetchAlbums:
            return Request(path: "albums", method: .get).urlRequest()
        case .fetchPhotos:
            return Request(path: "photos", method: .get).urlRequest()
        }
    }
}

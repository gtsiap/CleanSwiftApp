//
//  PostsRepository.swift
//  Data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Domain
import RxSwift

public class PostsRepository: Domain.PostsRepository {

    public func fetchPosts() -> Observable<[Post]> {
        return Observable.just([Post]())
    }
}

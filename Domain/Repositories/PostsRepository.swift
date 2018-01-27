//
//  PostsRepository.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift

public protocol PostsRepository: class {
    func fetch() -> Observable<[Post]>
}


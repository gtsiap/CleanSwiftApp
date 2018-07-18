//
//  AlbumsRepository.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 09/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift

public protocol AlbumsRepository: class {
    func fetch() -> Observable<[Album]>
}


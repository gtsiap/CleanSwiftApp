//
//  PhotosRepository.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 12/04/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift

public protocol PhotosRepository: class {
    func fetch() -> Observable<[Photo]>
}

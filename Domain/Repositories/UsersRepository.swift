
//
//  UsersRepository.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 29/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import RxSwift

public protocol UsersRepository: class {
    func fetch() -> Observable<[User]>
}


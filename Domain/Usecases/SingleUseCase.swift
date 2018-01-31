//
//  SingleUseCase.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift

public class SingleUseCase<Result> {

    let scheduler: SchedulerType

    init(scheduler: SchedulerType) {
        self.scheduler = scheduler
    }

    public func execute() -> Single<Result> {
        return singleForUserCase().subscribeOn(scheduler)
    }

    func singleForUserCase() -> Single<Result> {
        fatalError("Missing Implementation")
    }
}


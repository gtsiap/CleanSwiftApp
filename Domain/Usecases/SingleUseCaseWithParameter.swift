//
//  SingleUseCaseWithParam.swift
//  Domain
//
//  Created by Giorgos Tsiapaliokas on 10/03/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift

public class SingleUseCaseWithParameter<Result, Parameter> {

    let scheduler: SchedulerType

    init(scheduler: SchedulerType) {
        self.scheduler = scheduler
    }

    public final func execute(parameter: Parameter) -> Single<Result> {
        return singleForUserCase(parameter: parameter).subscribeOn(scheduler)
    }

    func singleForUserCase(parameter: Parameter) -> Single<Result> {
        fatalError("Missing Implementation")
    }
}

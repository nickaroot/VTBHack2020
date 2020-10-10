//
//  CalculatorCalculatorInteractor.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

class CalculatorInteractor {
    var presenter: CalculatorPresenterProtocol?
    var router: CalculatorRouterProtocol?
}

extension CalculatorInteractor: CalculatorInteractorProtocol {
    func closeClicked() {
        router?.closeModule()
    }
}

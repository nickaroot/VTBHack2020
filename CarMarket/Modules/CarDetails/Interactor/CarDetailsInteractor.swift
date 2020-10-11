//
//  CarDetailsCarDetailsInteractor.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

class CarDetailsInteractor {
    var presenter: CarDetailsPresenterProtocol?
    var router: CarDetailsRouterProtocol?
}

extension CarDetailsInteractor: CarDetailsInteractorProtocol {
    func backButtonClicked() {
        router?.close()
    }
    
    func calculatorButtonClicked() {
        router?.showCalculator()
    }
}

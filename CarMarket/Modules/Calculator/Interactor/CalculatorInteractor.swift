//
//  CalculatorCalculatorInteractor.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import Foundation

class CalculatorInteractor {
    var presenter: CalculatorPresenterProtocol?
    var router: CalculatorRouterProtocol?
}

extension CalculatorInteractor: CalculatorInteractorProtocol {
    func calculateClicked(with datasource: CalculatorViewModel) {
        presenter?.updateStarted()
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
            self.presenter?.updateFinished()
            datasource.update(with: (58_000, 2, 1_310_157))
            self.presenter?.updateView()
        }
    }
    
    func applyForLoanClicked() {
        router?.closeModule()
    }
    
    func closeClicked() {
        router?.closeModule()
    }
}

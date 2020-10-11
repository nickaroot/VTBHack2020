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
    func applicationDone() {
        router?.closeModule()
    }
    
    func calculateClicked(with datasource: CalculatorViewModel) {
        presenter?.updateStarted()
        
        let clientTypes = [
            "ac43d7e4-cd8c-4f6f-b18a-5ccbc1356f75"
        ]
        let cost = (datasource.cellDatasources[0].output as? Int) ?? 0
        let initialFee = (datasource.cellDatasources[1].output as? Int) ?? 0
        let kaskoValue = ((datasource.cellDatasources[4].output as? Bool) ?? false) ? 42000 : 0
        let language: Language = .ru
        let residualPayment = 37 as Decimal
        let settingsName = "Haval"
        let specialConditions: [String] = [
        "57ba0183-5988-4137-86a6-3d30a4ed8dc9",
        "b907b476-5a26-4b25-b9c0-8091e9d5c65f",
        "cbfc4ef3-af70-4182-8cf6-e73f361d1e68"
        ]
        let term = (datasource.cellDatasources[2].output as? Int) ?? 0
        
        let params = CalculateParameters(
            clientTypes: clientTypes,
            cost: Decimal(integerLiteral: cost),
            initialFee: Decimal(integerLiteral: initialFee),
            kaskoValue: kaskoValue,
            language: language,
            residualPayment: residualPayment,
            settingsName: settingsName,
            specialConditions: specialConditions,
            term: term
        )
        
        CalculatorService.calculate(with: params) { response, error in
            self.presenter?.updateFinished()
            defer { self.presenter?.updateView() }
            if let response = response {
                guard
                    let result = response.result,
                    let payment = result.payment,
                    let rate = result.contractRate,
                    let sum = result.loanAmount else {
                    datasource.update(with: (nil, nil, nil))
                    return
                }
                datasource.update(with: (Int(payment as NSDecimalNumber), Int(rate as NSDecimalNumber), Int(sum as NSDecimalNumber)))
            } else if let error = error {
                datasource.update(with: (nil, nil, nil))
            } else {
                datasource.update(with: (nil, nil, nil))
            }
        }
    }
    
    func applyForLoanClicked(with datasource: CalculatorViewModel) {
        datasource.updateForApplication()
        presenter?.updateView()
    }
    
    func closeClicked() {
        router?.closeModule()
    }
}

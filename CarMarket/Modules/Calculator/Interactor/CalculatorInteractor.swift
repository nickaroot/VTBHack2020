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
    
    var incomeAmount: Decimal?
    var reqAmount: Int?
    var reqTerm: Int?
    var reqCost: Int?
}

extension CalculatorInteractor: CalculatorInteractorProtocol {
    func applicationDone(with datasource: CalculatorViewModel) {
        let values = datasource.outputValues
        let calculation = datasource.calculation
        
        let person = Person(
            birth_date_time: (values[2] as? String) ?? "",
            birth_place: (values[3] as? String) ?? "",
            family_name: (values[4] as? String) ?? "",
            first_name: (values[5] as? String) ?? "",
            gender: .unknown,
            middle_name: (values[6] as? String) ?? "",
            nationality_country_code: "RU"
        )
        
        let customerParty = CustomerParty(
            email: (values[0] as? String) ?? "",
            income_amount: incomeAmount ?? Decimal(integerLiteral: 0),
            person: person,
            phone: ""
        )

        let params = CarLoanParameters(
            comment: "Empty",
            customer_party: customerParty,
            datetime: DateFormatter().string(from: Date()),
            interest_rate: calculation?.contractRate ?? 0,
            requested_amount: reqAmount ?? 0,
            requested_term: reqTerm ?? 0,
            trade_mark: "",
            vehicle_cost: reqCost ?? 0
        )

        presenter?.updateStarted()
        CarLoanService.getCarloan(with: params) { response, error in
            self.presenter?.updateFinished()
            
            if let response = response {
                let decisionStatus = response.application?.decision_report?.application_status
                self.router?.showApplicationDecision(with: decisionStatus)
            } else if error != nil {
                
            } else {
                
            }
        }
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
                    datasource.update(with: (nil, nil, nil), andCalcRes: nil)
                    return
                }
                datasource.update(with: (Int(payment as NSDecimalNumber), Int(rate as NSDecimalNumber), Int(sum as NSDecimalNumber)), andCalcRes: result)
                
                self.incomeAmount = Decimal(integerLiteral: initialFee)
                self.reqTerm = term
                self.reqCost = cost
                self.reqAmount = cost - initialFee
                
            } else if error != nil {
                datasource.update(with: (nil, nil, nil), andCalcRes: nil)
            } else {
                datasource.update(with: (nil, nil, nil), andCalcRes: nil)
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

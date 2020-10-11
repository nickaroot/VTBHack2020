//
//  CalculatorCalculatorContract.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import Foundation

protocol CalculatorViewProtocol: class {
    func update()
    func dimView(withActivity: Bool)
    func undimView()
}

protocol CalculatorInteractorProtocol: class {
    func closeClicked()
    func calculateClicked(with datasource: CalculatorViewModel)
    func applyForLoanClicked(with datasource: CalculatorViewModel)
    func applicationDone(with datasource: CalculatorViewModel)
}

protocol CalculatorPresenterProtocol: class {
    func updateView()
    func updateStarted(withActivity: Bool)
    func updateFinished()
}

protocol CalculatorRouterProtocol: class {
    func closeModule()
    func showApplicationDecision(with: CarLoanResponse.Application.Decision.ApplicationStatus?)
    func showApplicationError()
}

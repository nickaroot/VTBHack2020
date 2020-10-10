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
    func dimView()
    func undimView()
}

protocol CalculatorInteractorProtocol: class {
    func closeClicked()
    func calculateClicked(with datasource: CalculatorViewModel)
    func applyForLoanClicked()
}

protocol CalculatorPresenterProtocol: class {
    func updateView()
    func updateStarted()
    func updateFinished()
}

protocol CalculatorRouterProtocol: class {
    func closeModule()
}

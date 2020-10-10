//
//  CalculatorCalculatorContract.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import Foundation

protocol CalculatorViewProtocol: class {
    // TODO: Declare view methods
}

protocol CalculatorInteractorProtocol: class {
    func closeClicked()
}

protocol CalculatorPresenterProtocol: class {
    // TODO: Declare presenter methods
}

protocol CalculatorRouterProtocol: class {
    func closeModule()
}

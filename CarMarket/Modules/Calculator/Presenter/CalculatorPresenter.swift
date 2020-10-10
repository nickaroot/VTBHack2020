//
//  CalculatorCalculatorPresenter.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

class CalculatorPresenter {
    weak var view: CalculatorViewProtocol?
}

extension CalculatorPresenter: CalculatorPresenterProtocol {
    func updateStarted() {
        view?.dimView()
    }
    
    func updateFinished() {
        view?.undimView()
    }
    
    func updateView() {
        view?.update()
    }
}

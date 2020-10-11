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
    func updateStarted(withActivity: Bool) {
        view?.dimView(withActivity: withActivity)
    }
    
    func updateFinished() {
        view?.undimView()
    }
    
    func updateView() {
        view?.update()
    }
}

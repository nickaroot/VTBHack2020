//
//  CarDetailsCarDetailsContract.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import Foundation

protocol CarDetailsViewProtocol: class {
    // TODO: Declare view methods
}

protocol CarDetailsInteractorProtocol: class {
    func calculatorButtonClicked()
    func backButtonClicked()
}

protocol CarDetailsPresenterProtocol: class {
    // TODO: Declare presenter methods
}

protocol CarDetailsRouterProtocol: class {
    func showCalculator()
    func close()
}

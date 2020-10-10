//
//  CarDetailsCarDetailsInteractor.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

class CarDetailsInteractor {
    weak var presenter: CarDetailsPresenterProtocol?
    weak var router: CarDetailsRouterProtocol?
}

extension CarDetailsInteractor: CarDetailsInteractorProtocol {

}

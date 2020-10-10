//
//  MainTabMainTabInteractor.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

class MainTabInteractor {
    weak var presenter: MainTabPresenterProtocol?
    weak var router: MainTabRouterProtocol?
}

extension MainTabInteractor: MainTabInteractorProtocol {
    func parameterSearchClicked() {
        router?.showParameterSearch()
    }
    
    func photoSearchClicked() {
        router?.showPhotoSearch()
    }
    
    func viewIsReady() {
        
    }
}

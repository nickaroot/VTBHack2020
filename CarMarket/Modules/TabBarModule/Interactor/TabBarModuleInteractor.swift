//
//  TabBarModuleTabBarModuleInteractor.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

class TabBarModuleInteractor {
    weak var presenter: TabBarModulePresenterProtocol?
    weak var router: TabBarModuleRouterProtocol?
}

extension TabBarModuleInteractor: TabBarModuleInteractorProtocol {

}

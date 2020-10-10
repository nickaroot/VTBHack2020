//
//  MainTabMainTabContract.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import Foundation

protocol MainTabViewProtocol: class {
    // TODO: Declare view methods
}

protocol MainTabInteractorProtocol: class {
    func viewIsReady()
    func parameterSearchClicked()
    func photoSearchClicked()
}

protocol MainTabPresenterProtocol: class {
    // TODO: Declare presenter methods
}

protocol MainTabRouterProtocol: class {
    func showParameterSearch()
    func showPhotoSearch()
}

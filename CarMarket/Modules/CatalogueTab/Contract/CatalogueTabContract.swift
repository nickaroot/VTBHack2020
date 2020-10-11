//
//  CatalogueTabCatalogueTabContract.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import Foundation

protocol CatalogueTabViewProtocol: class {
    func updateOffers(_ data: [CarModel])
}

protocol CatalogueTabInteractorProtocol: class {
    func viewIsReady()
    func carClicked(carModel: CarModel)
}

protocol CatalogueTabPresenterProtocol: class {
    func fetched(offers: [CarModel])
}

protocol CatalogueTabRouterProtocol: class {
    func showErrorAlert(with message: String)
    func showCarDetails(carModel: CarModel)
}

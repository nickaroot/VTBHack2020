//
//  CatalogueTabCatalogueTabContract.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import Foundation

protocol CatalogueTabViewProtocol: class {
    func updateOffers(_ data: [CarCellDatasource])
}

protocol CatalogueTabInteractorProtocol: class {
    func viewIsReady()
    func carClicked()
}

protocol CatalogueTabPresenterProtocol: class {
    func fetched(offers: [CarCellDatasource])
}

protocol CatalogueTabRouterProtocol: class {
    func showErrorAlert(with message: String)
    func showCarDetails()
}

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
}

protocol CatalogueTabPresenterProtocol: class {
    func fetched(offers: [CarCellDatasource])
}

protocol CatalogueTabRouterProtocol: class {
    // TODO: Declare router methods
}

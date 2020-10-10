//
//  CatalogueTabCatalogueTabPresenter.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

class CatalogueTabPresenter {
    weak var view: CatalogueTabViewProtocol?
}

extension CatalogueTabPresenter: CatalogueTabPresenterProtocol {
    func fetched(offers: [CarCellDatasource]) {
        view?.updateOffers(offers)
    }
}

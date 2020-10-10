//
//  CatalogueTabCatalogueTabInteractor.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

class CatalogueTabInteractor {
    weak var presenter: CatalogueTabPresenterProtocol?
    weak var router: CatalogueTabRouterProtocol?
}

extension CatalogueTabInteractor: CatalogueTabInteractorProtocol {

}

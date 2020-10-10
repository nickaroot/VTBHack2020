//
//  CatalogueTabCatalogueTabInteractor.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

class CatalogueTabInteractor {
    var presenter: CatalogueTabPresenterProtocol?
    var router: CatalogueTabRouterProtocol?
    
    private func fetchOffers() {
        CatalogueWorker.fetchOffers { data, error in
            if let data = data {
                self.presenter?.fetched(offers: data)
            } else if let error = error {
                
            } else {
                
            }
        }
    }
}

extension CatalogueTabInteractor: CatalogueTabInteractorProtocol {
    func viewIsReady() {
        fetchOffers()
    }
}

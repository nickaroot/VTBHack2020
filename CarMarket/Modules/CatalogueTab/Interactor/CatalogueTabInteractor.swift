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
        MarketplaceService.getMarketplace { [weak self] (marketplace, error) in
            if let marketplace = marketplace,
               let offers = marketplace.list.flatMap({ list -> [CarModel] in
                list.flatMap { carBrand -> [CarModel] in
                    carBrand.models ?? []
                }
               }) {
                self?.presenter?.fetched(offers: offers)
            } else if let error = error {
                self?.router?.showErrorAlert(with: error.localizedDescription)
            } else {
                self?.router?.showErrorAlert(with: "common_error_unknown".localized())
            }
        }
        
//        CatalogueWorker.fetchOffers { data, error in
//            if let data = data {
//                self.presenter?.fetched(offers: data)
//            } else if let error = error {
//                self.router?.showErrorAlert(with: error)
//            } else {
//                self.router?.showErrorAlert(with: "common_error_unknown".localized())
//            }
//        }
    }
}

extension CatalogueTabInteractor: CatalogueTabInteractorProtocol {
    func viewIsReady() {
        fetchOffers()
    }
    
    func carClicked(carModel: CarModel) {
        router?.showCarDetails(carModel: carModel)
    }
}

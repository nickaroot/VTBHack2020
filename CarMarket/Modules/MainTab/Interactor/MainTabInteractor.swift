//
//  MainTabMainTabInteractor.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//
import Foundation

class MainTabInteractor {
    var presenter: MainTabPresenterProtocol?
    var router: MainTabRouterProtocol?
    
    private func fetchData() {
        MainTabWorker.fetchArticles { data, error in
            if let data = data {
                self.presenter?.articlesFetched(data)
            } else if let error = error {
                self.router?.showErrorAlert(with: error)
            } else {
                self.router?.showErrorAlert(with: "common_error_unknown".localized())
            }
        }
        
        MainTabWorker.fetchFeatures { data, error in
            if let data = data {
                self.presenter?.featuresFetched(data)
            } else if let error = error {
                self.router?.showErrorAlert(with: error)
            } else {
                self.router?.showErrorAlert(with: "common_error_unknown".localized())
            }
        }
        
        MainTabWorker.fetchVideos { data, error in
            if let data = data {
                self.presenter?.videosFetched(data)
            } else if let error = error {
                self.router?.showErrorAlert(with: error)
            } else {
                self.router?.showErrorAlert(with: "common_error_unknown".localized())
            }
            
        }
    }
}

extension MainTabInteractor: MainTabInteractorProtocol {
    func selectedArticle(with id: String) {
        router?.showArticle(id)
    }
    
    func selectedFeature(_ feature: FeatureIdentifier) {
        router?.showFeature(feature)
    }
    
    func parameterSearchClicked() {
        router?.showParameterSearch()
    }
    
    func photoSearchClicked() {
        router?.showPhotoSearch()
    }
    
    func viewIsReady() {
        fetchData()
    }
}

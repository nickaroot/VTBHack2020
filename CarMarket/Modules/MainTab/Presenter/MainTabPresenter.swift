//
//  MainTabMainTabPresenter.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

class MainTabPresenter {
    weak var view: MainTabViewProtocol?
}

extension MainTabPresenter: MainTabPresenterProtocol {
    func articlesFetched(_ articles: [PhotoTextCardDatasource]) {
        view?.updateArticles(with: articles)
    }
    
    func featuresFetched(_ features: [FeatureCellDatasource]) {
        view?.updateFeatures(with: features)
    }
}

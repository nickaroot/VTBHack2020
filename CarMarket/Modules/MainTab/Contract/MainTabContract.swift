//
//  MainTabMainTabContract.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import Foundation

protocol MainTabViewProtocol: class {
    func updateArticles(with articles: [PhotoTextCardDatasource])
    func updateFeatures(with features: [FeatureCellDatasource])
    func updateVideos(with videos: [VideoCellDatasource])
}

protocol MainTabInteractorProtocol: class {
    func viewIsReady()
    func parameterSearchClicked()
    func photoSearchClicked()
    func selectedFeature(_ feature: FeatureIdentifier)
    func selectedArticle(with id: String)
}

protocol MainTabPresenterProtocol: class {
    func articlesFetched(_ articles: [PhotoTextCardDatasource])
    func featuresFetched(_ features: [FeatureCellDatasource])
    func videosFetched(_ videos: [VideoCellDatasource])
}

protocol MainTabRouterProtocol: class {
    func showParameterSearch()
    func showPhotoSearch()
    func showErrorAlert(with message: String)
    func showFeature(_ feature: FeatureIdentifier)
    func showArticle(_ id: String)
}

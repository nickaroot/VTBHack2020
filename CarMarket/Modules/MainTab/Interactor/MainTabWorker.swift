//
//  MainTabWorker.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import Foundation

class MainTabWorker {
    static func fetchArticles(completion: @escaping (_ articles: [PhotoTextCardDatasource]?, _ error: String?) -> Void) {
        let fakeData: [PhotoTextCardDatasource] = [
            PhotoTextCardDatasource(id: UUID.init().uuidString, photo: #imageLiteral(resourceName: "Image"), text: "Рейтинг лучших автомобилей класса С 2020 года"),
            PhotoTextCardDatasource(id: UUID.init().uuidString, photo: #imageLiteral(resourceName: "Image"), text: "Рейтинг лучших автомобилей класса С 2020 года"),
            PhotoTextCardDatasource(id: UUID.init().uuidString, photo: #imageLiteral(resourceName: "Image"), text: "Рейтинг лучших автомобилей класса С 2020 года")
        ]
        
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: false) { _ in
            completion(fakeData, nil)
        }
    }
    
    static func fetchFeatures(completion: @escaping (_ features: [FeatureCellDatasource]?, _ error: String?) -> Void) {
        let fakeData: [FeatureCellDatasource] = [
            FeatureCellDatasource(id: .calc, backgroundColor: .systemPink, image: #imageLiteral(resourceName: "CalculatorFeature"), text: "Кредитный калькулятор"),
            FeatureCellDatasource(id: .vr, backgroundColor: .systemBlue, image: #imageLiteral(resourceName: "VRFeature"), text: "VR каталог"),
            FeatureCellDatasource(id: .bot, backgroundColor: .systemOrange, image: #imageLiteral(resourceName: "BotFeature"), text: "Телеграм-бот")
        ]
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: false) { _ in
            completion(fakeData, nil)
        }
    }
}

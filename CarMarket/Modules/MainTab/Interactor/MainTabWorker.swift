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
            FeatureCellDatasource(id: .telegram, backgroundColor: .systemPink, image: #imageLiteral(resourceName: "TelegramStory"), text: "Телеграм-бот"),
            FeatureCellDatasource(id: .firstAuto, backgroundColor: .systemBlue, image: #imageLiteral(resourceName: "FirstAutoStory"), text: "Первое авто"),
            FeatureCellDatasource(id: .newAuto, backgroundColor: .systemOrange, image: #imageLiteral(resourceName: "NewStory"), text: "Новинки сезона"),
            FeatureCellDatasource(id: .bank, backgroundColor: .systemOrange, image: #imageLiteral(resourceName: "BankStory"), text: "Предложения банка")
        ]
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: false) { _ in
            completion(fakeData, nil)
        }
    }
    
    static func fetchVideos(completion: @escaping (_ features: [VideoCellDatasource]?, _ error: String?) -> Void) {
        let fakeData: [VideoCellDatasource] = [
            VideoCellDatasource(backgroundImage: #imageLiteral(resourceName: "PoloVideo"), text: "Видеообзор нового volkswagen polo"),
            VideoCellDatasource(backgroundImage: #imageLiteral(resourceName: "ToyotaVideo"), text: "Эксплуатация Toyota Fortuner. Подводим итоги.")
        ]
        
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: false) { _ in
            completion(fakeData, nil)
        }
    }
}

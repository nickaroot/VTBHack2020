//
//  CatalogueWorker.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import Foundation

class CatalogueWorker {
    static func fetchOffers(completion: @escaping (_ offers: [CarCellDatasource]?, _ error: String?) -> Void) {
        let fakeData: [CarCellDatasource] = [
            CarCellDatasource(id: UUID.init().uuidString, carName: "Some car name", carPrice: "1 500 000", loanPayment: "15 000", carPhotoURLs: [
                "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bugatti-chiron-pur-sport-106-1582836604.jpg",
                "https://www.telegraph.co.uk/content/dam/news/2017/11/11/Lam1_trans_NvBQzQNjv4BqnAdySV0BR-4fDN_-_p756cVfcy8zLGPV4EhRkjQy7tg.jpg"
            ]),
            CarCellDatasource(id: UUID.init().uuidString, carName: "Some car name 2", carPrice: "2 500 000", loanPayment: "20 000", carPhotoURLs: [
                "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bugatti-chiron-pur-sport-106-1582836604.jpg",
                "https://www.telegraph.co.uk/content/dam/news/2017/11/11/Lam1_trans_NvBQzQNjv4BqnAdySV0BR-4fDN_-_p756cVfcy8zLGPV4EhRkjQy7tg.jpg"
            ]),
            CarCellDatasource(id: UUID.init().uuidString, carName: "Some car name 3", carPrice: "3 500 000", loanPayment: "30 000", carPhotoURLs: [
                "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bugatti-chiron-pur-sport-106-1582836604.jpg",
                "https://www.telegraph.co.uk/content/dam/news/2017/11/11/Lam1_trans_NvBQzQNjv4BqnAdySV0BR-4fDN_-_p756cVfcy8zLGPV4EhRkjQy7tg.jpg"
            ])
        ]
        
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) { _ in
                completion(fakeData, nil)
            }
        }
    }
}

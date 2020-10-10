//
//  CarCell.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import UIKit
import ImageSlideshow
import Kingfisher

struct CarCellDatasource {
    let id: String
    let carName: String
    let carPrice: String
    let loanPayment: String
    let carPhotoURLs: [String]
}

class CarCell: UITableViewCell {
    @IBOutlet weak var carPhotos: ImageSlideshow!
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var carPriceLabel: UILabel!
    @IBOutlet weak var loanPayLabel: UILabel!
    
    var datasource: CarCellDatasource? {
        didSet {
            if let datasource = datasource {
                reloadData(with: datasource)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carPhotos.layer.cornerRadius = 8
        carPhotos.contentScaleMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func favoriteClicked(_ sender: Any) {
        
    }
    
    @IBAction func ARClicked(_ sender: Any) {
        
    }
    
    private func reloadData(with datasource: CarCellDatasource) {
        carNameLabel.text = datasource.carName
        carPriceLabel.text = datasource.carPrice
        loanPayLabel.text = datasource.loanPayment
        
        let imageSources: [KingfisherSource] = datasource.carPhotoURLs.map { url in
            print(url)
            return KingfisherSource(urlString: url)
        }.compactMap { $0 }
        
        DispatchQueue.main.async {
            self.carPhotos.setImageInputs(imageSources)
        }
    }
}

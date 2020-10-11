//
//  CarCell.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import UIKit
import ImageSlideshow
import Kingfisher
import QuickLook

struct CarCellDatasource {
    let id: String
    let carName: String
    let carPrice: String
    let loanPayment: String
    let carPhotoURLs: [String]
    let carModel: CarModel
    
    weak var navController: UINavigationController!
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
    
    private func previewARContents() {
        let previewController = QLPreviewController()
        previewController.dataSource = self
        
        datasource?.navController?.present(previewController, animated: true, completion: nil)
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
        previewARContents()
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

extension CarCell: QLPreviewControllerDataSource {
    
    /// Quick Look で表示するアイテム数
    ///
    /// - Parameter controller: controller
    /// - Returns: Quick Look で表示するアイテム数
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    /// Quick Look で表示するアイテムを返す
    ///
    /// - Parameters:
    ///   - controller: controller
    ///   - index: アイテムのindex値
    /// - Returns: Quick Look で表示するアイテム
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        // Return the file URL to the .usdz file
        let fileUrl = Bundle.main.url(forResource: "bmw_4_series_03_for_iOS_1", withExtension: "usdz")!
        
        return fileUrl as QLPreviewItem
    }
}

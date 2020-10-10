//
//  VideoCell.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import UIKit

struct VideoCellDatasource {
    let backgroundImage: UIImage
    let text: String
}

class VideoCell: UICollectionViewCell {
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var datasource: VideoCellDatasource? {
        didSet {
            if let datasource = datasource {
                reloadData(with: datasource)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundImage.removeGradientLayer()
        let c1 = UIColor(red: 11 / 255, green: 36 / 255, blue: 74 / 255, alpha: 0)
        let c2 = UIColor(red: 11 / 255, green: 36 / 255, blue: 74 / 255, alpha: 0.8)
        let gradientColors = [c1.cgColor, c2.cgColor]
        
        backgroundImage.applyGradient(colors: gradientColors)
    }
    
    private func reloadData(with datasource: VideoCellDatasource) {
        backgroundImage.image = datasource.backgroundImage
        textLabel.text = datasource.text
    }

}

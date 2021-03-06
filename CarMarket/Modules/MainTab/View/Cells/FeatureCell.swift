//
//  FeatureCell.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import UIKit

enum FeatureIdentifier: String {
    case telegram
    case firstAuto
    case newAuto
    case bank
}

struct FeatureCellDatasource {
    let id: FeatureIdentifier
    let backgroundColor: UIColor
    let image: UIImage
    let text: String
}

class FeatureCell: UICollectionViewCell {
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var datasource: FeatureCellDatasource? {
        didSet {
            if let datasource = datasource {
                reloadData(with: datasource)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
        imageView.layer.cornerRadius = 8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.removeGradientLayer()
        let c1 = UIColor(red: 11 / 255, green: 36 / 255, blue: 74 / 255, alpha: 0)
        let c2 = UIColor(red: 11 / 255, green: 36 / 255, blue: 74 / 255, alpha: 0.8)
        let gradientColors = [c1.cgColor, c2.cgColor]
        
        imageView.applyGradient(colors: gradientColors)
        
        layer.borderWidth = 2
        layer.borderColor = UIColor(red: 58 / 255, green: 131 / 255, blue: 241 / 255, alpha: 1).cgColor
    }

    private func reloadData(with datasource: FeatureCellDatasource) {
        innerView.backgroundColor = datasource.backgroundColor
        imageView.image = datasource.image
        textLabel.text = datasource.text
    }
}

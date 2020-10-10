//
//  FeatureCell.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import UIKit

enum FeatureIdentifier: String {
    case calc = "Calculator"
    case vr = "VR"
    case bot = "BOT"
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
        self.layer.cornerRadius = 8
        // Initialization code
    }

    private func reloadData(with datasource: FeatureCellDatasource) {
        innerView.backgroundColor = datasource.backgroundColor
        imageView.image = datasource.image
        textLabel.text = datasource.text
    }
}

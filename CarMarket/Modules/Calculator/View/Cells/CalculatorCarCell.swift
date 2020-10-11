//
//  CalculatorCarCell.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 11.10.2020.
//

import UIKit

struct CarCellModel {
    let photo: UIImage
    let name: String
    let price: Int
    let monthlyPayment: Int
    let rate: Int
    let loanSum: Int
}

class CalculatorCarCellDatasource: CalculatorCellDatasource {
    init(_ type: CalculatorCellType) {
        self.type = type
        
        switch type {
        case .car(let type):
            self.car = type
        default:
            self.car = CarCellModel(
                photo: #imageLiteral(resourceName: "PoloVideo"),
                name: "KIA",
                price: 1_500_000,
                monthlyPayment: 25_000,
                rate: 2,
                loanSum: 1_250_000
            )
        }
    }
    
    var type: CalculatorCellType
    var cellId: String = "CalculatorCarCellID"
    var output: Any? = nil
    
    var car: CarCellModel
}

class CalculatorCarCell: UITableViewCell, CalculatorBaseCell {
    var datasource: CalculatorCellDatasource? {
        didSet {
            if let datasource = datasource as? CalculatorCarCellDatasource {
                reloadData(with: datasource.car)
            }
        }
    }
    
    @IBOutlet weak var carPhoto: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    @IBOutlet weak var monthlyPayment: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var loanSum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func reloadData(with datasource: CarCellModel) {
        carPhoto.image = datasource.photo
        carName.text = datasource.name
        carPrice.text = "\(datasource.price) ₽"
        
        monthlyPayment.text = "\(datasource.monthlyPayment) ₽"
        rate.text = "\(datasource.rate) %"
        loanSum.text = "\(datasource.loanSum) ₽"
    }
    
}

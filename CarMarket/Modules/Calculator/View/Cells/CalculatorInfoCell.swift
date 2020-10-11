//
//  CalculatorInfoCell.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import UIKit

struct CalculatorInfoCellDatasource: CalculatorCellDatasource {
    var type: CalculatorCellType
    let value: Int?
    var cellId: String = "CalculatorInfoCellID"
    var output: Any? = nil
    
}

enum CalculatorInfoCellDataType {
    case money
    case percent
}
class CalculatorInfoCell: UITableViewCell, CalculatorBaseCell {
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var valueCell: UILabel!
    
    var datasource: CalculatorCellDatasource? {
        didSet {
            if let datasource = datasource as? CalculatorInfoCellDatasource {
                reloadData(with: datasource)
            }
        }
    }
    var dataType: CalculatorInfoCellDataType = .money
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func reloadData(with datasource: CalculatorInfoCellDatasource) {
        switch datasource.type {
        case .info(let type):
            switch type {
            case .monthlyPayment:
                titleCell.text = "Ежемесячный платёж"
                dataType = .money
            case .interestRate:
                titleCell.text = "Процентная ставка"
                dataType = .percent
            case .loanSum:
                titleCell.text = "Сумма кредита"
                dataType = .money
            default:
                break
            }
        default:
            break
        }
        
        valueCell.text = formattedValue(from: datasource.value) ?? "Unknown"
    }
    
    private func formattedValue(from value: Int?) -> String? {
        guard let value = value else { return nil }
        if dataType == .money {
            let formatter = NumberFormatter()
            let locale = Locale(identifier: "ru-Ru")
            formatter.locale = locale
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber(integerLiteral: value))
        } else {
            return "\(value) %"
        }
    }
    
}

//
//  CalculatorSwitcherCell.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import UIKit

class CalculatorSwitcherCellDatasource: CalculatorCellDatasource {
    init(type: CalculatorCellType, state: Bool, additionalSum: Int? = nil) {
        self.type = type
        self.state = state
        self.additionalSum = additionalSum
    }
    
    var cellId: String = "CalculatorSwitcherCellId"
    var type: CalculatorCellType
    var state: Bool = true
    var additionalSum: Int? = nil
    var output: Any? {
        return state
    }
}

class CalculatorSwitcherCell: UITableViewCell, CalculatorBaseCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var additionalLabel: UILabel!
    @IBOutlet weak var cellSwitch: UISwitch!
    @IBOutlet weak var stackView: UIStackView!
    var labelBackup: UILabel?
    
    var datasource: CalculatorCellDatasource? {
        didSet {
            if let datasource = datasource as? CalculatorSwitcherCellDatasource {
                reloadData(with: datasource)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        if let label = labelBackup {
            stackView.addArrangedSubview(label)
        }
        
        additionalLabel = labelBackup
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if let datasource = datasource as? CalculatorSwitcherCellDatasource {
            datasource.state = sender.isOn
        }
    }
    
    private func reloadData(with datasource: CalculatorSwitcherCellDatasource) {
        cellSwitch.isOn = datasource.state
        
        switch datasource.type {
        case .switcher(let type):
            switch type {
            case .kasko:
                titleLabel.text = "КАСКО"
                let formatter = NumberFormatter()
                formatter.maximumFractionDigits = 0
                formatter.numberStyle = .currency
                formatter.locale = Locale(identifier: "ru-Ru")
                formatter.currencySymbol = Locale(identifier: "ru-Ru").currencySymbol
                additionalLabel.text = formatter.string(from: NSNumber(integerLiteral: datasource.additionalSum ?? 0)) ?? "\(datasource.additionalSum ?? 666_666)"
                
            case .card:
                titleLabel.text = "Карта Автолюбитель"
                labelBackup = additionalLabel
                additionalLabel.removeFromSuperview()
                
            case .insurance:
                titleLabel.text = "Зарплата на ВТБ"
                labelBackup = additionalLabel
                additionalLabel.removeFromSuperview()
            case .salaryClient:
                titleLabel.text = "Страхование жизни"
                labelBackup = additionalLabel
                additionalLabel.removeFromSuperview()
            default:
                break
            }
        default:
            break
        }
    }
    
}

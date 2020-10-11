//
//  CalculatorTextInputCell.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 11.10.2020.
//

import UIKit

class CalculatorTextInputCellDatasource: CalculatorCellDatasource {
    init(_ type: CalculatorCellType) {
        self.type = type
    }
    
    var type: CalculatorCellType
    var cellId: String = "CalculatorTextInputCellID"
    var value: String = ""
    var output: Any? {
        return value
    }
}

class CalculatorTextInputCell: UITableViewCell, CalculatorBaseCell {
    var datasource: CalculatorCellDatasource? {
        didSet {
            if let datasource = datasource as? CalculatorTextInputCellDatasource {
                reloadData(with: datasource)
            }
        }
    }
    
    @IBOutlet weak var inputField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func reloadData(with datasource: CalculatorTextInputCellDatasource) {
        switch datasource.type {
        case .textInput(let type):
            switch type {
            case .email:
                inputField.placeholder = "Email"
            case .birthDate:
                inputField.placeholder = "Дата рождения"
            case .birthPlace:
                inputField.placeholder = "Место рождения"
            case .income:
                inputField.placeholder = "Доход"
            case .name:
                inputField.placeholder = "Имя"
            case .secondName:
                inputField.placeholder = "Фамилия"
            case .patronymic:
                inputField.placeholder = "Отчество"
            }
        default:
            break
        }
    }
}

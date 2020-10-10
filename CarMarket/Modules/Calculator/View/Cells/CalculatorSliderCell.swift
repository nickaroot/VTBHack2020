//
//  CalculatorSeparatorCell.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import UIKit

class CalculatorSliderCellDatasource: CalculatorCellDatasource {
    init(type: CalculatorCellType, minValue: Int, maxValue: Int, currentValue: Int) {
        self.type = type
        self.minValue = minValue
        self.maxValue = maxValue
        self.currentValue = currentValue
    }
    
    var cellId: String = "sliderCellID"
    var type: CalculatorCellType
    let minValue: Int
    let maxValue: Int
    var currentValue: Int
    var output: Any? {
        return currentValue
    }
}

enum CalculatorSliderDataType {
    case money
    case months
}

class CalculatorSliderCell: UITableViewCell, CalculatorBaseCell {
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var currentValueLabel: UILabel!
    @IBOutlet weak var minValueLabel: UILabel!
    @IBOutlet weak var maxValueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var dataType: CalculatorSliderDataType = .money
    var datasource: CalculatorCellDatasource? {
        didSet {
            if let datasource = datasource as? CalculatorSliderCellDatasource {
                reloadData(with: datasource)
            }
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        slider.thumbTintColor = .clear
        slider.setThumbImage(#imageLiteral(resourceName: "SliderThumb"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func reloadData(with datasource: CalculatorSliderCellDatasource) {
        switch datasource.type {
        case .slider(let type):
            switch type {
            case .price:
                cellTitleLabel.text = "Стоимость"
                dataType = .money
            case .income:
                cellTitleLabel.text = "Первоначальный взнос"
                dataType = .money
            case .length:
                cellTitleLabel.text = "Срок кредита"
                dataType = .months
            default:
                break
            }
        default:
            break
        }
        
        minValueLabel.text = formattedValue(withValue: datasource.minValue) ?? "\(datasource.minValue)"
        maxValueLabel.text = formattedValue(withValue: datasource.maxValue) ?? "\(datasource.maxValue)"
        currentValueLabel.text = formattedValue(withValue: datasource.currentValue) ?? "\(datasource.currentValue)"
        
        slider.minimumValue = Float(datasource.minValue)
        slider.maximumValue = Float(datasource.maxValue)
        slider.value = Float(datasource.currentValue)
    }
    
    private func formattedValue(withValue value: Int) -> String? {
        if dataType == .money {
            let formatter = NumberFormatter()
            formatter.locale = Locale(identifier: "ru-RU")
            formatter.maximumFractionDigits = 0
            formatter.currencySymbol = Locale(identifier: "ru-RU").currencySymbol
            formatter.numberStyle = .currency
            return formatter.string(from: NSNumber(integerLiteral: value))
        } else {
            return "\(value) месяцев"
        }
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let newValue = dataType == .money ? Int(round(sender.value / 1000) * 1000) : Int(sender.value)
        if var datasource = datasource as? CalculatorSliderCellDatasource {
            datasource.currentValue = newValue
        }
        currentValueLabel.text = formattedValue(withValue: newValue) ?? "\(newValue)"
    }
}

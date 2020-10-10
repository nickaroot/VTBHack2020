//
//  CalculatorSeparatorCell.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import UIKit

struct CalculatorSliderCellDatasource: CalculatorCellDatasource {
    var type: CalculatorCellType
    let minValue: Int
    let maxValue: Int
    var currentValue: Int
}

class CalculatorSliderCell: UITableViewCell, CalculatorBaseCell {
    @IBOutlet weak var currentValueLabel: UILabel!
    @IBOutlet weak var minValueLabel: UILabel!
    @IBOutlet weak var maxValueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var type: CalculatorCellType?
    var datasource: CalculatorCellDatasource? {
        didSet {
            if let datasource = datasource as? CalculatorSliderCellDatasource {
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
    
    private func reloadData(with datasource: CalculatorSliderCellDatasource) {
        minValueLabel.text = "\(datasource.minValue)"
        maxValueLabel.text = "\(datasource.maxValue)"
        currentValueLabel.text = "\(datasource.currentValue)"
        
        slider.minimumValue = Float(datasource.minValue)
        slider.maximumValue = Float(datasource.maxValue)
        slider.value = Float(datasource.currentValue)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let newValue = Int(sender.value)
        if var datasource = datasource as? CalculatorSliderCellDatasource {
            datasource.currentValue = newValue
        }
        currentValueLabel.text = "\(newValue)"
    }
}

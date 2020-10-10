//
//  CalculatorViewModel.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import UIKit

enum CalculatorCellType {
    case slider(_ type: CalculatorPropertyType)
    case switcher(_ type: CalculatorPropertyType)
    case separator
    case empty
}

enum CalculatorPropertyType {
    case price
    case income
    case length
    case kasko
    case card
    case insurance
}

protocol CalculatorCellDatasource {
    var type: CalculatorCellType { get set }
    var cellId: String { get set }
}

protocol CalculatorBaseCell: UITableViewCell {
    var type: CalculatorCellType? { get set }
    var datasource: CalculatorCellDatasource? { get set }
}

class CalculatorViewModel {
    let nibs: [UINib: String] = [
        .init(nibName: "CalculatorSliderCell", bundle: nil): "sliderCellID",
        .init(nibName: "CalculatorSeparatorCell", bundle: nil): "separatorCellID"
        
    ]
    
    let cellDatasources: [CalculatorCellDatasource] = [
        CalculatorSliderCellDatasource(type: .slider(.price), minValue: 10_000, maxValue: 3_000_000, currentValue: 1_500_000),
        CalculatorSliderCellDatasource(type: .slider(.income), minValue: 10_000, maxValue: 1_000_000, currentValue: 500_000),
        CalculatorSliderCellDatasource(type: .slider(.length), minValue: 6, maxValue: 120, currentValue: 60),
        CalculatorSeparatorCellDatasource()
    ]
    
    var price = 1_500_000
    var income = 500_000
    var length = 90
    var hasKasko = true
    var hasCard = true
    var hasInsurance = true
}

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
    case info(_ type: CalculatorPropertyType)
    case empty
    
    case textInput(_ type: CalculatorTextInputType)
    case car(_ type: CarCellModel)
}

enum CalculatorTextInputType {
    case email
    case income
    case birthDate
    case birthPlace
    case secondName
    case name
    case patronymic
}

// Можно разнести на 3 разных enum, но не до того
enum CalculatorPropertyType {
    // Sliders
    case price
    case income
    case length
    
    // Switchers
    case kasko
    case card
    case insurance
    case salaryClient
    
    // Info
    case monthlyPayment
    case interestRate
    case loanSum
}

protocol CalculatorCellDatasource {
    var type: CalculatorCellType { get set }
    var cellId: String { get set }
    var output: Any? { get }
}

protocol CalculatorBaseCell: UITableViewCell {
    var datasource: CalculatorCellDatasource? { get set }
}

class CalculatorViewModel {
    static let testCar = CarCellModel(
        photo: #imageLiteral(resourceName: "PoloVideo"),
        name: "BWM",
        price: 2_500_000,
        monthlyPayment: 25_000,
        rate: 2,
        loanSum: 1_250_000
    )
    let nibs: [UINib: String] = [
        .init(nibName: "CalculatorSliderCell", bundle: nil): "sliderCellID",
        .init(nibName: "CalculatorSeparatorCell", bundle: nil): "separatorCellID",
        .init(nibName: "CalculatorSwitcherCell", bundle: nil): "CalculatorSwitcherCellId",
        .init(nibName: "CalculatorEmptyCell", bundle: nil): "CalculatorEmptyCellID",
        .init(nibName: "CalculatorInfoCell", bundle: nil): "CalculatorInfoCellID",
        .init(nibName: "CalculatorTextInputCell", bundle: nil): "CalculatorTextInputCellID",
        .init(nibName: "CalculatorCarCell", bundle: nil): "CalculatorCarCellID"
    ]
    
    var cellDatasources: [CalculatorCellDatasource] = [
        CalculatorSliderCellDatasource(type: .slider(.price), minValue: 10_000, maxValue: 3_000_000, currentValue: 1_500_000),
        CalculatorSliderCellDatasource(type: .slider(.income), minValue: 10_000, maxValue: 1_000_000, currentValue: 500_000),
        CalculatorSliderCellDatasource(type: .slider(.length), minValue: 1, maxValue: 7, currentValue: 3),
        CalculatorSeparatorCellDatasource(),
        CalculatorSwitcherCellDatasource(type: .switcher(.kasko), state: true, additionalSum: 32_000),
        CalculatorSwitcherCellDatasource(type: .switcher(.card), state: true),
        CalculatorSwitcherCellDatasource(type: .switcher(.salaryClient), state: true),
        CalculatorSwitcherCellDatasource(type: .switcher(.insurance), state: true),
        CalculatorEmptyCellDatasource(),
        CalculatorEmptyCellDatasource()
    ]
    
    let cellsForLoanApplication: [CalculatorCellDatasource] = [
        CalculatorCarCellDatasource(.car(testCar)),
        CalculatorTextInputCellDatasource(.textInput(.email)), // 0
        CalculatorTextInputCellDatasource(.textInput(.income)), // 1
        CalculatorTextInputCellDatasource(.textInput(.birthDate)), // 2
        CalculatorTextInputCellDatasource(.textInput(.birthPlace)), // 3
        CalculatorTextInputCellDatasource(.textInput(.secondName)), // 4
        CalculatorTextInputCellDatasource(.textInput(.name)), // 5
        CalculatorTextInputCellDatasource(.textInput(.patronymic)), // 6
        CalculatorEmptyCellDatasource(),
        CalculatorEmptyCellDatasource()
    ]
    
    var outputValues: [Any] {
        return cellDatasources.map { $0.output }.compactMap { $0 }
    }
    
    var calculation: CalcResult?
    
    var price = 1_500_000
    var income = 500_000
    var length = 90
    var hasKasko = true
    var hasCard = true
    var hasInsurance = true
    
    func update(with calculationResults: (Int?, Int?, Int?), andCalcRes: CalcResult?) {
        cellDatasources = [
            CalculatorInfoCellDatasource(type: .info(.monthlyPayment), value: calculationResults.0),
            CalculatorInfoCellDatasource(type: .info(.interestRate), value: calculationResults.1),
            CalculatorInfoCellDatasource(type: .info(.loanSum), value: calculationResults.2)
        ]
        
        calculation = andCalcRes
    }
    
    func updateForApplication() {
        cellDatasources = cellsForLoanApplication
    }
}

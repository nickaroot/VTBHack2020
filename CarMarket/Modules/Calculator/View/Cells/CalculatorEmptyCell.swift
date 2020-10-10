//
//  CalculatorEmptyCell.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import UIKit

struct CalculatorEmptyCellDatasource: CalculatorCellDatasource {
    var output: Any? = nil
    
    var type: CalculatorCellType = .empty
    var cellId: String = "CalculatorEmptyCellID"
}

class CalculatorEmptyCell: UITableViewCell, CalculatorBaseCell {
    var datasource: CalculatorCellDatasource?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

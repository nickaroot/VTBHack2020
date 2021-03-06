//
//  CalculatorSeparatorCell.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import UIKit

struct CalculatorSeparatorCellDatasource: CalculatorCellDatasource {
    var output: Any? = nil
    
    var cellId: String = "separatorCellID"
    var type: CalculatorCellType = .separator
}

class CalculatorSeparatorCell: UITableViewCell, CalculatorBaseCell {
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

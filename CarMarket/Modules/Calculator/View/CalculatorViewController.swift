//
//  CalculatorCalculatorViewController.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    // MARK: Properties
    var interactor: CalculatorInteractorProtocol!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeClicked(_ sender: Any) {
        interactor.closeClicked()
    }
}

extension CalculatorViewController: CalculatorViewProtocol {

}

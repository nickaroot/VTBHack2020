//
//  CarDetailsCarDetailsViewController.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

class CarDetailsViewController: UIViewController {

    // MARK: Properties
    var interactor: CarDetailsInteractorProtocol!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CarDetailsViewController: CarDetailsViewProtocol {

}

//
//  MainTabMainTabViewController.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

class MainTabViewController: UIViewController {

    // MARK: Properties
    var interactor: MainTabInteractorProtocol!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainTabViewController: MainTabViewProtocol {

}

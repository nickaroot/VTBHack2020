//
//  TabBarModuleTabBarModuleViewController.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

class TabBarModuleViewController: UITabBarController {

    // MARK: Properties
    var interactor: TabBarModuleInteractorProtocol!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        tabBar.barTintColor = UIColor(red: 0, green: 40 / 255, blue: 130 / 255, alpha: 1)
        tabBar.unselectedItemTintColor = .white
    }
}

extension TabBarModuleViewController: TabBarModuleViewProtocol {

}

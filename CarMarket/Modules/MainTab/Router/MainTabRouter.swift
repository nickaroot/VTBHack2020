//
//  MainTabMainTabRouter.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

class MainTabRouter {
    var transitionHandler: UIViewController?

    static func setupModuleWithNib() -> MainTabViewController {
        let viewController = MainTabViewController(nibName: "MainTabViewController", bundle: nil)

        let presenter = MainTabPresenter()

        let router = MainTabRouter()
        router.transitionHandler = viewController

        let interactor = MainTabInteractor()

        viewController.interactor = interactor
        
        interactor.presenter = presenter
        interactor.router = router

        presenter.view = viewController
   
        return viewController
    }
}


extension MainTabRouter: MainTabRouterProtocol {

}

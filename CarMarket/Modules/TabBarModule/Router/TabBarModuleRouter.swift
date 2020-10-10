//
//  TabBarModuleTabBarModuleRouter.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

class TabBarModuleRouter {
    var transitionHandler: UIViewController?

    static func setupModuleWithNib() -> TabBarModuleViewController {
        let viewController = TabBarModuleViewController(nibName: "TabBarModuleViewController", bundle: nil)

        let presenter = TabBarModulePresenter()

        let router = TabBarModuleRouter()
        router.transitionHandler = viewController

        let interactor = TabBarModuleInteractor()

        viewController.interactor = interactor
        
        interactor.presenter = presenter
        interactor.router = router

        presenter.view = viewController
   
        return viewController
    }
}


extension TabBarModuleRouter: TabBarModuleRouterProtocol {

}

//
//  CatalogueTabCatalogueTabRouter.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

class CatalogueTabRouter {
    var transitionHandler: UIViewController?

    static func setupModuleWithNib() -> CatalogueTabViewController {
        let viewController = CatalogueTabViewController(nibName: "CatalogueTabViewController", bundle: nil)

        let presenter = CatalogueTabPresenter()

        let router = CatalogueTabRouter()
        router.transitionHandler = viewController

        let interactor = CatalogueTabInteractor()

        viewController.interactor = interactor
        
        interactor.presenter = presenter
        interactor.router = router

        presenter.view = viewController
   
        return viewController
    }
}


extension CatalogueTabRouter: CatalogueTabRouterProtocol {

}

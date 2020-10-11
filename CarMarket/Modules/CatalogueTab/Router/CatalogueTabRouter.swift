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
    func showCarDetails() {
        guard let transitionHandler = transitionHandler else { return }
        let module = CarDetailsRouter.setupModuleWithNib()
        module.hidesBottomBarWhenPushed = true
        
        transitionHandler.navigationController?.pushViewController(module, animated: true)
    }
    
    func showErrorAlert(with message: String) {
        guard let transitionHandler = transitionHandler else { return }
        
        let alert = UIAlertController(title: "common_error_error".localized(), message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            transitionHandler.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        
        transitionHandler.present(alert, animated: true, completion: nil)
    }
}

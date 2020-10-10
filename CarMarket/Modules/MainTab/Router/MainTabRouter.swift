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
    func showArticle(_ id: String) {
        guard let transitionHandler = transitionHandler else { return }
        
        let alert = UIAlertController(title: "Статья", message: id, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            transitionHandler.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        
        transitionHandler.present(alert, animated: true, completion: nil)
    }
    
    func showFeature(_ feature: FeatureIdentifier) {
        guard let transitionHandler = transitionHandler else { return }
        
        let alert = UIAlertController(title: "Фича", message: feature.rawValue, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            transitionHandler.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        
        transitionHandler.present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlert(with message: String) {
        guard let transitionHandler = transitionHandler else { return }
        
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            transitionHandler.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        
        transitionHandler.present(alert, animated: true, completion: nil)
    }
    
    func showParameterSearch() {
        // TODO: - ...
    }
    
    func showPhotoSearch() {
        // TODO: - ...
    }
    

}

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
    func showVideo(_ id: String) {
        guard let transitionHandler = transitionHandler else { return }
        
        let alert = UIAlertController(title: "Видео", message: id, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "common_OK".localized(), style: .cancel) { _ in
            transitionHandler.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        
        transitionHandler.present(alert, animated: true, completion: nil)
    }
    
    func showCalculator() {
        guard let transitionHandler = transitionHandler else { return }
        
        let module = CalculatorRouter.setupModuleWithNib()
        transitionHandler.present(module, animated: true, completion: nil)
    }
    
    func showArticle(_ id: String) {
        guard let transitionHandler = transitionHandler else { return }
        
        let alert = UIAlertController(title: "Статья", message: id, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "common_OK".localized(), style: .cancel) { _ in
            transitionHandler.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        
        transitionHandler.present(alert, animated: true, completion: nil)
    }
    
    func showFeature(_ feature: FeatureIdentifier) {
        guard let transitionHandler = transitionHandler else { return }
        
        let alert = UIAlertController(title: "Фича", message: feature.rawValue, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "common_OK".localized(), style: .cancel) { _ in
            transitionHandler.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        
        transitionHandler.present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlert(with message: String) {
        guard let transitionHandler = transitionHandler else { return }
        
        let alert = UIAlertController(title: "common_error_error".localized(), message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "common_OK".localized(), style: .cancel) { _ in
            transitionHandler.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        
        transitionHandler.present(alert, animated: true, completion: nil)
    }
    
    func showParameterSearch() {
        guard let transitionHandler = transitionHandler else { return }
        
        let alert = UIAlertController(title: "Поиск по параметрам", message: "ААААААААА", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "common_OK".localized(), style: .cancel) { _ in
            transitionHandler.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        
        transitionHandler.present(alert, animated: true, completion: nil)
    }
    
    func showPhotoSearch() {
        guard let transitionHandler = transitionHandler else { return }
        
        let ARSearchVC = ARSearchViewController(nibName: "ARSearchViewController", bundle: ARSearchViewController)
        
        transitionHandler.navigationController?.pushViewController(ARSearchVC, animated: true)
        
//        guard let transitionHandler = transitionHandler else { return }
//
//        let alert = UIAlertController(title: "Поиск по фото", message: "ААААААААА", preferredStyle: .alert)
//        let alertAction = UIAlertAction(title: "common_OK".localized(), style: .cancel) { _ in
//            transitionHandler.dismiss(animated: true, completion: nil)
//        }
//        alert.addAction(alertAction)
//
//        transitionHandler.present(alert, animated: true, completion: nil)
    }
    

}

//
//  CalculatorCalculatorRouter.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

class CalculatorRouter {
    var transitionHandler: UIViewController?

    static func setupModuleWithNib() -> CalculatorViewController {
        let viewController = CalculatorViewController(nibName: "CalculatorViewController", bundle: nil)
        
        let presenter = CalculatorPresenter()

        let router = CalculatorRouter()
        router.transitionHandler = viewController

        let interactor = CalculatorInteractor()

        viewController.interactor = interactor
        
        interactor.presenter = presenter
        interactor.router = router

        presenter.view = viewController
   
        return viewController
    }
}


extension CalculatorRouter: CalculatorRouterProtocol {
    func showApplicationError() {
        let module = UnifiedModalRequestVC.makeWait(withDelegate: self)
        transitionHandler?.present(module, animated: true, completion: nil)
    }
    
    func showApplicationDecision(with: CarLoanResponse.Application.Decision.ApplicationStatus?) {
        let module = UnifiedModalRequestVC.makeSucces(withDelegate: self)
        transitionHandler?.present(module, animated: true, completion: nil)
    }
    
    func closeModule() {
        transitionHandler?.dismiss(animated: true, completion: nil)
    }
}

extension CalculatorRouter: UnifiedModalRequestVCDelegate {
    func okClicked() {
        transitionHandler?.dismiss(animated: true, completion: nil)
    }
    
    
}

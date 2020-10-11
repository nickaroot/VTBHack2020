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
    func showApplicationDecision(with: CarLoanResponse.Application.Decision.ApplicationStatus?) {
        
    }
    
    func closeModule() {
        transitionHandler?.dismiss(animated: true, completion: nil)
    }
}

//
//  CarDetailsCarDetailsRouter.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

class CarDetailsRouter {
    var transitionHandler: UIViewController?

    static func setupModuleWithNib(carModel: CarModel? = nil) -> CarDetailsViewController {
        let viewController = CarDetailsViewController(nibName: "CarDetailsViewController", bundle: nil)

        let presenter = CarDetailsPresenter()

        let router = CarDetailsRouter()
        router.transitionHandler = viewController

        let interactor = CarDetailsInteractor()

        viewController.interactor = interactor
        
        interactor.presenter = presenter
        interactor.router = router

        presenter.view = viewController
        
        viewController.carModel = carModel
   
        return viewController
    }
}


extension CarDetailsRouter: CarDetailsRouterProtocol {
    func close() {
        transitionHandler?.navigationController?.popViewController(animated: true)
    }
    
    func showCalculator() {
        let module = CalculatorRouter.setupModuleWithNib()
        transitionHandler?.present(module, animated: true, completion: nil)
    }
}

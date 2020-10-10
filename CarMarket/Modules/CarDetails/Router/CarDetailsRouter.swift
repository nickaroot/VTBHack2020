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

    static func setupModuleWithNib() -> CarDetailsViewController {
        let viewController = CarDetailsViewController(nibName: "CarDetailsViewController", bundle: nil)

        let presenter = CarDetailsPresenter()

        let router = CarDetailsRouter()
        router.transitionHandler = viewController

        let interactor = CarDetailsInteractor()

        viewController.interactor = interactor
        
        interactor.presenter = presenter
        interactor.router = router

        presenter.view = viewController
   
        return viewController
    }
}


extension CarDetailsRouter: CarDetailsRouterProtocol {

}

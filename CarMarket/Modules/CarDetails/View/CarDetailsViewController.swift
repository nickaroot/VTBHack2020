//
//  CarDetailsCarDetailsViewController.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

class CarDetailsViewController: UIViewController {

    // MARK: Properties
    var interactor: CarDetailsInteractorProtocol!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func configureUI() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.hidesBottomBarWhenPushed = true
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .VTBlightBlue
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let backBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "BackNavBar"), style: .plain, target: self, action: #selector(backButtonClicked))
        navigationItem.leftBarButtonItem = backBarButton
        
        let shareButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Share"), style: .plain, target: self, action: #selector(shareButtonClicked))
        let favoriteButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Star Outline"), style: .plain, target: self, action: #selector(favoriteButtonClicked))
        navigationItem.rightBarButtonItems = [favoriteButton, shareButton]
    }
    
    @objc private func backButtonClicked() {
        
    }
    
    @objc private func shareButtonClicked() {
        
    }
    
    @objc private func favoriteButtonClicked() {
        
    }
}

extension CarDetailsViewController: CarDetailsViewProtocol {

}

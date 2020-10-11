//
//  CarDetailsCarDetailsViewController.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

class CarDetailsViewController: UIViewController {
    @IBOutlet weak var carPhotoCarousel: DazzleCarouselView!
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var yandexImage: UIImageView!
    @IBOutlet weak var carPriceLabel: UILabel!
    
    @IBOutlet weak var yaerLabel: UILabel!
    @IBOutlet weak var transmissionLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var engineLabel: UILabel!
    @IBOutlet weak var tabLabel: UILabel!
    @IBOutlet weak var wheelDriveLabel: UILabel!
    @IBOutlet weak var wheelLabel: UILabel!
    
    // MARK: Properties
    var interactor: CarDetailsInteractorProtocol!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureCollections()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func configureCollections() {
        carPhotoCarousel.datasource = self
    }
    
    private func configureUI() {
        carPhotoCarousel.backgroundColor = .clear
        yandexImage.layer.cornerRadius = 16
        
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

extension CarDetailsViewController: DazzleCarouselViewDatasource {
    func numberOfViewsToShow() -> Int {
        return 3
    }
    
    func view(at index: Int) -> UIView {
        let card = PhotoTextCard()
        card.datasource = PhotoTextCardDatasource(id: UUID.init().uuidString, photo: #imageLiteral(resourceName: "CarPhoto"), text: nil)
        return card
    }
}

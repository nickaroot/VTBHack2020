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
    @IBOutlet weak var taxLabel: UILabel!
    
    var carModel: CarModel? {
        didSet {
            reloadData()
        }
    }
    
    // MARK: Properties
    var interactor: CarDetailsInteractorProtocol!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureCollections()
        
        reloadData()
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
    
    private func reloadData() {
        carNameLabel?.text = "Kia Rio"
        carPriceLabel?.text = "768 000 ₽"
        
        yaerLabel?.text = "2019"
        transmissionLabel?.text = "Автоматическая"
        bodyLabel?.text = "Седан"
        engineLabel?.text = "2.0 л / 276 л. с. / Бензин"
        taxLabel?.text = "41 400 ₽"
        wheelDriveLabel?.text = "Полный"
        wheelLabel?.text = "Левый"
        
        if let carTitle = carModel?.title,
           let carBrand = carModel?.brand?.title {
            carNameLabel?.text = "\(carBrand) \(carTitle)"
        }
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        
        if let carPrice = carModel?.minPrice,
           let formattedPrice = formatter.string(from: NSNumber(integerLiteral: carPrice)) {
            carPriceLabel?.text = "\(formattedPrice) ₽"
        }
        
        if let carBody = carModel?.transportType?.title {
            bodyLabel?.text = carBody
        }
    }
    
    @objc private func backButtonClicked() {
        interactor.backButtonClicked()
    }
    
    @objc private func shareButtonClicked() {
        
    }
    
    @objc private func favoriteButtonClicked() {
        
    }
    
    @IBAction func loanButtonClicked(_ sender: Any) {
        interactor.calculatorButtonClicked()
    }
    
    @IBAction func calcButtonClicked(_ sender: Any) {
        interactor.calculatorButtonClicked()
    }
}

extension CarDetailsViewController: CarDetailsViewProtocol {

}

extension CarDetailsViewController: DazzleCarouselViewDatasource {
    func numberOfViewsToShow() -> Int {
        if carModel?.photo != nil {
            return 1
        }
        
        return 3
    }
    
    func view(at index: Int) -> UIView {
        let card = PhotoTextCard()
        
        if let carPhotoUrl = carModel?.photo, let url = URL(string: carPhotoUrl),
           let data = try? Data(contentsOf: url), let carPhoto = UIImage(data: data) {
            card.datasource = PhotoTextCardDatasource(id: UUID.init().uuidString, photo: carPhoto, text: nil)
        } else {
            card.datasource = PhotoTextCardDatasource(id: UUID.init().uuidString, photo: #imageLiteral(resourceName: "CarPhoto"), text: nil)
        }
        
        return card
    }
}

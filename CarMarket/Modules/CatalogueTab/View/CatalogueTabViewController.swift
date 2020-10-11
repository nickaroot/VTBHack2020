//
//  CatalogueTabCatalogueTabViewController.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

class CatalogueTabViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var offersCountLabel: UILabel!
    @IBOutlet weak var carsTableView: UITableView!
    
    // MARK: Properties
    var interactor: CatalogueTabInteractorProtocol!
    var cars: [CarModel] = []
    var timer: Timer?
    
    let carNib = UINib(nibName: "CarCell", bundle: nil)
    let carCellId = "carCellID"

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureTableView()
        startAnimatingOffersLabel()
        
        interactor.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func sortButtonClicked(_ sender: UIButton) {
    }
    
    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        carsTableView.showsVerticalScrollIndicator = false
    }
    
    private func configureTableView() {
        carsTableView.register(carNib, forCellReuseIdentifier: carCellId)
        
        carsTableView.dataSource = self
        carsTableView.delegate = self
    }
    
    private func startAnimatingOffersLabel() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            DispatchQueue.main.async {
                self.offersCountLabel.text = "{count} предложений".replacingOccurrences(of: "{count}", with: String(Int.random(in: 100...1000)))
            }
        }
    }
    
    private func stopAnimatingOffersLabel() {
        timer?.invalidate()
    }
}

extension CatalogueTabViewController: CatalogueTabViewProtocol {
    func updateOffers(_ data: [CarModel]) {
        stopAnimatingOffersLabel()
        cars = data
        offersCountLabel.text = "\(cars.count) предложений"
        carsTableView.reloadData()
    }
}

extension CatalogueTabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: carCellId, for: indexPath) as? CarCell else {
            return UITableViewCell()
        }
        
        let car = cars[indexPath.row]
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        
        var carPrice = "768 000 ₽"
        
        if let carCost = car.minPrice,
           let formattedCost = formatter.string(from: NSNumber(integerLiteral: carCost)) {
            carPrice = "\(formattedCost) ₽"
        }
        
        cell.datasource = CarCellDatasource(
            id: "\(car.id)" ?? "\(car.carId)",
            carName: "\(car.brand?.title ?? car.brand?.titleRus ?? "") \(car.title ?? car.titleRus ?? "")",
            carPrice: carPrice,
            loanPayment: "41 400 ₽",
            carPhotoURLs: car.photo != nil ? [car.photo!] : [],
            carModel: car
        )
        
        cell.datasource?.navController = navigationController
        
//        let selectionView = UIView()
//        selectionView.backgroundColor = UIColor(red: 0, green: 40 / 255, blue: 130 / 255, alpha: 1)
        
//        cell.selectedBackgroundView = selectionView
        
        return cell
    }
}

extension CatalogueTabViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor.carClicked(carModel: cars[indexPath.item])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}

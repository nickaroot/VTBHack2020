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
    var cars: [CarCellDatasource] = []
    
    let carNib = UINib(nibName: "CarCell", bundle: nil)
    let carCellId = "carCellID"

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureTableView()
    }
    
    @IBAction func sortButtonClicked(_ sender: UIButton) {
    }
    
    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configureTableView() {
        carsTableView.register(carNib, forCellReuseIdentifier: carCellId)
        
        carsTableView.dataSource = self
        carsTableView.delegate = self
    }
}

extension CatalogueTabViewController: CatalogueTabViewProtocol {

}

extension CatalogueTabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension CatalogueTabViewController: UITableViewDelegate {
    
}

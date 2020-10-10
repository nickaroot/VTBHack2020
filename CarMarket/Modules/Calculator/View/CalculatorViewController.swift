//
//  CalculatorCalculatorViewController.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var calculatorTableView: UITableView!
    
    // MARK: Properties
    var interactor: CalculatorInteractorProtocol!
    let datasource = CalculatorViewModel()
    let cellId = "CalculatorCellID"

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureTableView()
    }
    
    @IBAction func calculateClicked(_ sender: Any) {
        
    }
    
    @IBAction func closeClicked(_ sender: Any) {
        interactor.closeClicked()
    }
    
    private func configureUI() {
        calculateButton.setTitleColor(.white, for: .normal)
        calculateButton.setTitle("calculator_calculateButton_title".localized(), for: .normal)
        calculateButton.backgroundColor = .VTBlightBlue
        calculateButton.layer.cornerRadius = 8
        
        calculatorTableView.tableFooterView = UIView()
        calculatorTableView.separatorStyle = .none
    }
    
    private func configureTableView() {
        let nibs: [UINib: String] = [
            .init(nibName: "CalculatorSeparatorCell", bundle: nil): cellId
        ]
        
        nibs.map { calculatorTableView.register($0.key, forCellReuseIdentifier: $0.value) }
        
        
        calculatorTableView.dataSource = self
        calculatorTableView.delegate = self
    }
}

extension CalculatorViewController: CalculatorViewProtocol {
    
}

extension CalculatorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.cellDatasources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CalculatorBaseCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.datasource = datasource.cellDatasources[indexPath.row]
        
        return cell
    }
}

extension CalculatorViewController: UITableViewDelegate {
    
}

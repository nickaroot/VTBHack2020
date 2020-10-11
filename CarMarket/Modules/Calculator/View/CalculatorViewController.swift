//
//  CalculatorCalculatorViewController.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

enum CalculatorState {
    case calculation
    case application
    case done
}

class CalculatorViewController: UIViewController {
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var calculatorTableView: UITableView!
    
    // MARK: Properties
    var interactor: CalculatorInteractorProtocol!
    let datasource = CalculatorViewModel()
//    var isCalculated = false
    var state: CalculatorState = .calculation
    
    var dimmingView: UIView?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureTableView()
    }
    
    @IBAction func calculateClicked(_ sender: Any) {
        switch state {
        case .application:
            state = .done
            interactor.applyForLoanClicked(with: datasource)
        case .calculation:
            state = .application
            interactor.calculateClicked(with: datasource)
        case .done:
            interactor.applicationDone(with: datasource)
        }
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
        _ = datasource.nibs.map { calculatorTableView.register($0.key, forCellReuseIdentifier: $0.value) }
        
        
        calculatorTableView.dataSource = self
        calculatorTableView.delegate = self
    }
}

extension CalculatorViewController: CalculatorViewProtocol {
    func dimView() {
        dimmingView = UIView(frame: view.bounds)
        dimmingView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        
        let animatingView = UIActivityIndicatorView(style: .large)
        dimmingView?.addSubview(animatingView)
        
        animatingView.center = dimmingView!.center
        
        animatingView.centerXAnchor.constraint(equalTo: dimmingView!.centerXAnchor).isActive = true
        animatingView.centerYAnchor.constraint(equalTo: dimmingView!.centerYAnchor).isActive = true
        
        animatingView.startAnimating()
        
        
        view.addSubview(dimmingView!)
        
        
        UIView.animate(withDuration: 0.15) {
            self.dimmingView?.layoutSubviews()
            self.view.layoutSubviews()
        }
    }
    
    func undimView() {
        self.dimmingView?.removeFromSuperview()
        UIView.animate(withDuration: 0.15) {
            self.view.layoutSubviews()
        }
    }
    
    func update() {
        switch state {
        case .calculation:
            calculateButton.setTitle("Рассчитать", for: .normal)
        case .application:
            calculateButton.setTitle("Оформить заявку", for: .normal)
        case .done:
            calculateButton.setTitle("Отправить заявку", for: .normal)
        }
        
        calculatorTableView.reloadSections(IndexSet(integersIn: 0 ..< calculatorTableView.numberOfSections), with: .automatic)
    }
}

extension CalculatorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.cellDatasources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDatasource = datasource.cellDatasources[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellDatasource.cellId, for: indexPath) as? CalculatorBaseCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.datasource = cellDatasource
        
        return cell
    }
}

extension CalculatorViewController: UITableViewDelegate {
    
}

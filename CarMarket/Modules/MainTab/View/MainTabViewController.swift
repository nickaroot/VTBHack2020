//
//  MainTabMainTabViewController.swift
//  CarMarket
//
//  Created by Vitaliy Ramazanov on 10/10/2020.
//  Copyright © 2020 RxProject. All rights reserved.
//

import UIKit

class MainTabViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var parameterSearchView: UIView!
    @IBOutlet weak var photoSearchView: UIView!
    @IBOutlet weak var articlesCarousel: DazzleCarouselView!
    
    // MARK: Properties
    var interactor: MainTabInteractorProtocol!
    let dataForBigCarousel: [PhotoTextCardDatasource] = [(#imageLiteral(resourceName: "Image"), "Рейтинг лучших автомобилей класса С 2020 года"), (#imageLiteral(resourceName: "Image"), "Рейтинг лучших автомобилей класса С 2020 года"), (#imageLiteral(resourceName: "Image"), "Рейтинг лучших автомобилей класса С 2020 года")]

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureGestures()
        
        interactor.viewIsReady()
    }
    
    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        articlesCarousel.backgroundColor = .clear
        articlesCarousel.datasource = self
        articlesCarousel.delegate = self
    }
    
    private func configureGestures() {
        parameterSearchView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(parameterSearchClicked)))
        photoSearchView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(photoSearchClicked)))
        
    }
    
    @objc func parameterSearchClicked() {
        interactor.parameterSearchClicked()
    }
    
    @objc func photoSearchClicked() {
        interactor.photoSearchClicked()
    }
    
}

extension MainTabViewController: MainTabViewProtocol {

}

extension MainTabViewController: DazzleCarouselViewDatasource {
    func numberOfViewsToShow() -> Int {
        return dataForBigCarousel.count
    }
    
    func view(at index: Int) -> UIView {
        let viewToShow = PhotoTextCard()
        viewToShow.datasource = dataForBigCarousel[index]
        
        return viewToShow
    }
    
    
}

extension MainTabViewController: DazzleCarouselViewDelegate {
    func carouselPageChanged(to index: Int) {
        // do nothing...
    }
}

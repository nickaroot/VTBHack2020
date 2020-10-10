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
    @IBOutlet weak var featuresCarousel: UICollectionView!
    
    // MARK: Properties
    let featureNib = UINib(nibName: "FeatureCell", bundle: nil)
    let featureReuseId = "FeatureCellID"
    
    var interactor: MainTabInteractorProtocol!
    
    var articlesCarouselData: [PhotoTextCardDatasource] = []
    var featureCarouselData: [FeatureCellDatasource] = []

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureGestures()
        prepareCollections()
        
        interactor.viewIsReady()
    }
    
    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        articlesCarousel.backgroundColor = .clear
        
        featuresCarousel.backgroundColor = .clear
        
    }
    
    private func prepareCollections() {
        featuresCarousel.register(featureNib, forCellWithReuseIdentifier: featureReuseId)
        
        featuresCarousel.dataSource = self
        featuresCarousel.delegate = self
        
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
    func updateArticles(with articles: [PhotoTextCardDatasource]) {
        articlesCarouselData = articles
        articlesCarousel.reloadData()
    }
    
    func updateFeatures(with features: [FeatureCellDatasource]) {
        featureCarouselData = features
        featuresCarousel.reloadData()
    }
}

extension MainTabViewController: DazzleCarouselViewDatasource {
    func numberOfViewsToShow() -> Int {
        return articlesCarouselData.count
    }
    
    func view(at index: Int) -> UIView {
        let viewToShow = PhotoTextCard()
        viewToShow.datasource = articlesCarouselData[index]
        
        return viewToShow
    }
    
}

extension MainTabViewController: DazzleCarouselViewDelegate {
    func carouselViewTapped(at index: Int) {
        interactor.selectedArticle(with: articlesCarouselData[index].id)
    }
    
    func carouselPageChanged(to index: Int) {
        // do nothing...
    }
}

extension MainTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featureCarouselData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: featureReuseId, for: indexPath) as? FeatureCell else {
            return UICollectionViewCell()
        }
        
        cell.datasource = featureCarouselData[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor.selectedFeature(featureCarouselData[indexPath.row].id)
    }

}

extension MainTabViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 110)
    }
}

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
    @IBOutlet weak var storiesCarousel: UICollectionView!
    @IBOutlet weak var videosCarousel: UICollectionView!
    @IBOutlet weak var yaDriveView: UIImageView!
    
    // MARK: Properties
    let featureNib = UINib(nibName: "FeatureCell", bundle: nil)
    let storyReuseId = "FeatureCellID"
    
    let videoNib = UINib(nibName: "VideoCell", bundle: nil)
    let videoReuseId = "VideoCellID"
    
    
    var interactor: MainTabInteractorProtocol!
    
    var articles: [PhotoTextCardDatasource] = []
    var stories: [FeatureCellDatasource] = []
    var videos: [VideoCellDatasource] = []

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureGestures()
        prepareCollections()
        
        interactor.viewIsReady()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        articlesCarousel.scrollToPage(with: 0)
    }
    
    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        articlesCarousel.backgroundColor = .clear
        
        storiesCarousel.backgroundColor = .clear
        
        yaDriveView.layer.cornerRadius = 8
    }
    
    private func prepareCollections() {
        storiesCarousel.register(featureNib, forCellWithReuseIdentifier: storyReuseId)
        videosCarousel.register(videoNib, forCellWithReuseIdentifier: videoReuseId)
        
        storiesCarousel.dataSource = self
        storiesCarousel.delegate = self
        storiesCarousel.tag = 0
        
        articlesCarousel.datasource = self
        articlesCarousel.delegate = self
        
        videosCarousel.dataSource = self
        videosCarousel.delegate = self
        videosCarousel.tag = 1
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
    func updateVideos(with videos: [VideoCellDatasource]) {
        self.videos = videos
        videosCarousel.reloadData()
    }
    
    func updateArticles(with articles: [PhotoTextCardDatasource]) {
        self.articles = articles
        articlesCarousel.reloadData()
    }
    
    func updateFeatures(with features: [FeatureCellDatasource]) {
        stories = features
        storiesCarousel.reloadData()
    }
}

extension MainTabViewController: DazzleCarouselViewDatasource {
    func numberOfViewsToShow() -> Int {
        return articles.count
    }
    
    func view(at index: Int) -> UIView {
        let viewToShow = PhotoTextCard()
        viewToShow.datasource = articles[index]
        
        return viewToShow
    }
    
}

extension MainTabViewController: DazzleCarouselViewDelegate {
    func carouselViewTapped(at index: Int) {
        interactor.selectedArticle(with: articles[index].id)
    }
    
    func carouselPageChanged(to index: Int) {
        // do nothing...
    }
}

extension MainTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView.tag == 0 ? stories.count : videos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return getCell(forCollectionView: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 0:
            interactor.selectedFeature(stories[indexPath.row].id)
        default:
            // TODO
            return
        }
        
    }
    
    private func getCell(forCollectionView collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: storyReuseId, for: indexPath) as? FeatureCell else {
                return UICollectionViewCell()
            }
            cell.datasource = stories[indexPath.row]
            
            return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: videoReuseId, for: indexPath) as? VideoCell else {
                return UICollectionViewCell()
            }
            cell.datasource = videos[indexPath.row]
            
            return cell
        }
    }

}

extension MainTabViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            return CGSize(width: 85, height: 106)
        default:
            return CGSize(width: 181, height: 94)
        }
    }
}

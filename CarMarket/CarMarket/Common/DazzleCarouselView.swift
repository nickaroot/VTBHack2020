//
//  DazzleCarouselView.swift
//  SOL
//
//  Created by Виталий Рамазанов on 16.05.2020.
//  Copyright © 2020 SOL. All rights reserved.
//

import UIKit

protocol DazzleCarouselViewDatasource: class {
    func numberOfViewsToShow() -> Int
    func view(at index: Int) -> UIView
}

protocol DazzleCarouselViewDelegate: class {
    func carouselPageChanged(to index: Int)
    func carouselViewTapped(at index: Int)
}

class DazzleCarouselView: UIView {
    private let scrollView = UIScrollView()
    private var items = [UIView]()
    
    private let spaceBetweenViews: CGFloat = 8
    
    var currentViewIndex: Int? {
        didSet {
            if let idx = currentViewIndex {
                delegate?.carouselPageChanged(to: idx)
            }
        }
    }
    
    weak var datasource: DazzleCarouselViewDatasource? {
        didSet {
            reloadData()
        }
    }
    
    weak var delegate: DazzleCarouselViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.frame = bounds
        reloadData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func reloadData() {
        removeAllItems()
        guard let datasource = datasource else { return }
        
        let itemsCount = datasource.numberOfViewsToShow()
        
        var startX: CGFloat = spaceBetweenViews
        let viewWidth = bounds.width - (spaceBetweenViews * 2) - 4 // Магическая четвёрка
        for index in 0 ..< itemsCount {
            let view = datasource.view(at: index)
            items.append(view)
            
            let viewOrigin = CGPoint(x: startX, y: 8)
            let viewSize = CGSize(width: viewWidth, height: bounds.height - 16)
            view.frame = CGRect(origin: viewOrigin, size: viewSize)
            
            scrollView.addSubview(view)
            startX += viewSize.width + spaceBetweenViews / 2
            
            view.setNeedsLayout()
            view.layoutIfNeeded()
            
            scrollView.setNeedsLayout()
            scrollView.layoutIfNeeded()
        }
        
        let contentSize = CGFloat(itemsCount + 1) * spaceBetweenViews +
                          CGFloat(itemsCount) * viewWidth
        
        scrollView.contentSize.width = contentSize
    }
    
    func scrollToPage(with index: Int) {
        let view = items[index]
        if view == nil { return }
        let targetX = view.frame.minX - spaceBetweenViews / 2
        let targetY = scrollView.contentOffset.y
        scrollView.setContentOffset(CGPoint(x: targetX, y: targetY), animated: true)
        currentViewIndex = index
    }
    
    private func setup() {
        prepareScrollView()
    }
    
    private func removeAllItems() {
        items.forEach { $0.removeFromSuperview() }
        items.removeAll()
    }
    
    private func prepareScrollView() {
        addSubview(scrollView)
        scrollView.decelerationRate = .fast
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        scrollView.delegate = self
    }
}

extension DazzleCarouselView: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let visibleWidth = scrollView.bounds.width
        let currentPosition = scrollView.contentOffset.x
        let rightCorner = visibleWidth + currentPosition
        
        if velocity.x >= 0 {
            // Листаем вправо
            if let view = items.last(where: { view in
                let viewLeftCorner = view.frame.minX
                if (rightCorner - viewLeftCorner) > 0.15 * visibleWidth {
                    return true
                } else {
                    return false
                }
                }) {
                targetContentOffset.pointee.x = view.frame.minX - 8
                if let idx = items.lastIndex(of: view) {
                    currentViewIndex = idx
                }
            }
            
        } else {
            // Листаем влево
            if let view = items.first(where: { view in
                let viewRightCorner = view.frame.maxX
                
                if (viewRightCorner - currentPosition) > 0.15 * visibleWidth {
                    return true
                } else {
                    return false
                }
            }) {
                targetContentOffset.pointee.x = view.frame.minX - 8
                if let idx = items.firstIndex(of: view) {
                    currentViewIndex = idx
                }
            }
        }

    }
}

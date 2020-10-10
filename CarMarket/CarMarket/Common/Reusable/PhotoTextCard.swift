//
//  PhotoTextCard.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import UIKit

struct PhotoTextCardDatasource {
    let id: String
    let photo: UIImage
    let text: String?
}
class PhotoTextCard: UIView {
    @IBOutlet var view: UIView!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var datasource: PhotoTextCardDatasource? {
        didSet {
            if let datasource = datasource {
                reloadData(with: datasource)
            }
        }
    }
    
    init() {
        super.init(frame: .zero)
        Bundle.main.loadNibNamed("PhotoTextCard", owner: self, options: nil)
        self.addSubview(self.view)
        setContentViewAnchors()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        Bundle.main.loadNibNamed("PhotoTextCard", owner: self, options: nil)
        self.addSubview(self.view)
        setContentViewAnchors()
    }
    
    private func setContentViewAnchors() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoView.clipsToBounds = false
        view.layer.cornerRadius = 16
    }
    
    private func reloadData(with datasource: PhotoTextCardDatasource) {
        photoView.image = datasource.photo
        photoView.contentMode = .scaleAspectFill
        
        if let text = datasource.text {
            textLabel.text = text
        } else {
            textLabel.isHidden = true
        }
    }
}

//
//  AnotherDeviceActiveVC.swift
//  SOL
//
//  Created by Виталий Рамазанов on 05.11.2019.
//  Copyright © 2019 SOL. All rights reserved.
//

import UIKit

enum UnifiedModalType {
    case wait
    case success
}

protocol UnifiedModalRequestVCDelegate: class {
    func okClicked()
}

class UnifiedModalRequestVC: UIViewController {
    @IBOutlet fileprivate weak var innerView: UIView!
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var infoLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    
    var type: UnifiedModalType = .wait
    weak var delegate: UnifiedModalRequestVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpUI()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    private func setUpUI() {
        acceptButton.removeGradientLayer()
        
        switch type {
        case .success:
            applySuccessUI()
            
        case .wait:
            applyWaitUI()
        }
        acceptButton.backgroundColor = .VTBlightBlue
    }
    
    private func applySuccessUI() {
        self.view.layer.cornerRadius = 16
        self.innerView.layer.cornerRadius = 16
        acceptButton.layer.cornerRadius = 8
        
        let acceptTitle = "Хорошо!"
        setAcceptButton(title: acceptTitle)
        
        
        let title = "Заявка на автокредит одобрена!"
        let info = "Вы можете отслеживать процесс рассмотрения заявки в разделе 'Заявки' нижнего меню"
        setTitle(text: title)
        setInfo(text: info)
    }
    
    private func applyWaitUI() {
        let acceptTitle = "Заявка на автокредит отправлена в банк"
        setAcceptButton(title: acceptTitle)
        
        
        let title = "Заявка на автокредит одобрена!"
        let info = "Вы можете отслеживать процесс рассмотрения заявки в разделе 'Заявки' нижнего меню"
        setTitle(text: title)
        setInfo(text: info)
    }
    
    private func applyGeolocationUI() {
        setIcon(image: #imageLiteral(resourceName: "attentionIcon"))
        let acceptButtonTitle = "common_accept".localized()
        setAcceptButton(title: acceptButtonTitle)

        let cancelButtonTitle = "common_later".localized()
        setCancelButton(title: cancelButtonTitle)

        let title = "unified_modal_request_geoposition_request_title".localized()
        setTitle(text: title)

        let info = "unified_modal_request_geoposition_request_body".localized()
        setInfo(text: info)
    }
    
    private func applyCameraUI() {
        setIcon(image: #imageLiteral(resourceName: "attentionIcon"))
        let acceptButtonTitle = "common_accept".localized()
        setAcceptButton(title: acceptButtonTitle)

        let cancelButtonTitle = "common_later".localized()
        setCancelButton(title: cancelButtonTitle)

        let title = "unified_modal_request_camera_request_title".localized()
        setTitle(text: title)

        let info = "unified_modal_request_camera_request_body".localized()
        setInfo(text: info)
    }
    
    private func setIcon(image: UIImage) {
        
    }
    
    private  func setTitle(text: String) {
        titleLabel.text = text
    }
    
    private func setInfo(text: String) {
        infoLabel.text = text
    }
    
    private func setAcceptButton(title: String?) {
        acceptButton.setTitle(title, for: .normal)
    }
    
    private func setCancelButton(title: String?) {
        
    }
    @IBAction func okclicked(_ sender: UIButton) {
        dismiss(animated: true, completion: {
            self.delegate?.okClicked()
        })
    }
}

extension UnifiedModalRequestVC {
    static func makeVC() -> UnifiedModalRequestVC {
        return UnifiedModalRequestVC(nibName: "UnifiedModalRequestVC", bundle: nil)
    }
    
    static func makeSucces(withDelegate: UnifiedModalRequestVCDelegate?) -> UnifiedModalRequestVC {
        let vc = makeVC()
        vc.modalPresentationStyle = .overCurrentContext
        vc.type = .success
        vc.delegate = withDelegate
        return vc
    }
    
    static func makeWait(withDelegate: UnifiedModalRequestVCDelegate?) -> UnifiedModalRequestVC {
        let vc = makeVC()
        vc.modalPresentationStyle = .overCurrentContext
        vc.type = .wait
        vc.delegate = withDelegate
        return vc
    }
}

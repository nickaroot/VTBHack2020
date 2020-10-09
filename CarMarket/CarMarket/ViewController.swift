//
//  ViewController.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 09.10.2020.
//

import UIKit
import Speech

class ViewController: UIViewController {
    @IBOutlet weak var recognizedTextLabel: UILabel!
    @IBOutlet weak var recognitionButton: UIButton!
    
    var recognitionService: SpeechRecognitionService?
    var recognitionInProgress = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recognitionService = SpeechRecognitionService(locale: Locale(identifier: "ru_Ru"), aDelegate: self)
        
        authRecognition()
        
        configureUI()
    }

    @IBAction func recognitionButtonClicked(_ sender: Any) {
        guard let recognitionService = recognitionService else {
            showError("Не удалось инициализировать сервис распознавания речи")
            return
        }
        
        recognitionInProgress = !recognitionInProgress
        if recognitionInProgress {
            do {
                try recognitionService.startRecognition()
            } catch {
                showError("Не удалось запустить распознавание речи")
                recognitionInProgress = false
            }
        } else {
            recognitionService.stopRecognition()
        }
        
        setRecognitionButton(state: recognitionInProgress)
    }
    
    private func authRecognition() {
        SFSpeechRecognizer.requestAuthorization { state in
            switch state {
            case .authorized:
                return
            default:
                self.showError("Распознавание речи не разрешено")
            }
        }
    }
    
    private func configureUI() {
        recognitionButton.backgroundColor = .lightGray
        recognitionButton.layer.cornerRadius = recognitionButton.bounds.width / 2
    }
    
    private func setRecognitionButton(state: Bool) {
        let color = state ? UIColor.systemPink : UIColor.lightGray
        
        UIView.animate(withDuration: 0.25) {
            self.recognitionButton.backgroundColor = color
        }
    }
    
    private func updateLabel(with recognizedText: String) {
        recognizedTextLabel.text = recognizedText
    }
    
    private func showError(_ text: String) {
        
    }
}

extension ViewController: SpeechRecognitionDelegate {
    func transcriptionUpdated(with transcription: SFTranscription?) {
        if let transcription = transcription {
            updateLabel(with: transcription.formattedString)
        }
    }
}

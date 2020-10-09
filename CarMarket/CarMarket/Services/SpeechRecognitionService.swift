//
//  SpeechRecognitionService.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 09.10.2020.
//

import Speech

protocol SpeechRecognitionDelegate: class {
    func transcriptionUpdated(with: SFTranscription?)
}


class SpeechRecognitionService {
    // MARK: - Properties
    let audioEngine = AVAudioEngine()
    let speechRecognizer: SFSpeechRecognizer
    let request = SFSpeechAudioBufferRecognitionRequest()
    
    let nodeBus: AVAudioNodeBus = .zero
    let bufferSize: AVAudioFrameCount = 1024
    
    var recognitionTask: SFSpeechRecognitionTask?
    var delegate: SpeechRecognitionDelegate?
    
    // MARK: - Initialization
    init?(locale: Locale, aDelegate: SpeechRecognitionDelegate? = nil) {
        delegate = aDelegate
        
        if let sr = SFSpeechRecognizer(locale: locale) {
            speechRecognizer = sr
        } else {
            return nil
        }
    }
    
    // MARK: - Recognition methods
    func startRecognition() throws {
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: nodeBus)
        
        node.installTap(onBus: nodeBus, bufferSize: bufferSize, format: recordingFormat) { (buffer, _) in
            self.request.append(buffer)
        }
        
        audioEngine.prepare()
        try audioEngine.start()
        recognitionTask = speechRecognizer.recognitionTask(with: request) { (result, _) in
            self.delegate?.transcriptionUpdated(with: result?.bestTranscription)
        }
    }
    
    func stopRecognition() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: .zero)
        request.endAudio()
        recognitionTask?.cancel()
    }
}

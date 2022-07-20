//
//  InterfaceController.swift
//  WatchAppItungin WatchKit Extension
//
//  Created by Hastomi Riduan Munthe on 20/07/22.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var speechButton: WKInterfaceButton!
    
//    var audio: Audio = Audio(title: "", audio_path_data: "")
//    var datas : [Audio] = []
    
    var model = ViewModelWatch()
    
    var saveURL: URL = FileManager.default.getDocumentsDirectory().appendingPathComponent("recording.wav")
    
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    @IBAction func didRecord() {
        
        saveURL = FileManager.default.getDocumentsDirectory().appendingPathComponent("recording.wav")
        
        presentAudioRecorderController(withOutputURL: saveURL, preset: .narrowBandSpeech) { [self] success, error in
            if success {
                print("Saved successfully!")
                print(self.saveURL)
//                self.audio.title = "Recording01.wav"
//                self.audio.audio_path_data = ("\(saveURL)")
//                datas.append(audio)
                //send message
                sendMessage(title: "Recording01", audioPath: "\(saveURL)")
//                sendMessage(title: "Recording01", audioPath: String(contentsOf: saveURL!))
            } else {
                print(error?.localizedDescription ?? "Unknown error")
            }
        }
    }
    
    func sendMessage(title: String, audioPath: String) {
        // MARK: Send message menggunakan WCSession
        
        let dataMessage = ["title" : title, "audioPath" : audioPath]
        
        model.wcSession.sendMessage(dataMessage, replyHandler: nil)
    }
    
}

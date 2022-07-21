//
//  ViewModelPhone.swift
//  iOSApp
//
//  Created by Ditha Nurcahya Avianty on 20/07/22.
//

import SwiftUI
import WatchConnectivity

class ViewModelPhone: NSObject, WCSessionDelegate, ObservableObject {
    
    var wcSession: WCSession
    
    //Emoji & color
    @Published var dataTitle: String = ""
    @Published var dataAudioPath: String = ""
    
    // Init session and activate watch connectivity
    init(session: WCSession = .default){
        self.wcSession = session
        super.init()
        self.wcSession.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // MARK: Capture Message
        
        DispatchQueue.main.async {
//            self.dataCounter += 1
            
            self.dataTitle = message["title"] as? String ?? "Unknown"
            self.dataAudioPath = message["audioPath"] as? String ?? "Unknown"
        }
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        //
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        //
    }
    
}

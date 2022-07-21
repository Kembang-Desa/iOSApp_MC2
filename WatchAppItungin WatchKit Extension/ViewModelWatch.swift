//
//  ViewModelWatch.swift
//  WatchAppItungin WatchKit Extension
//
//  Created by Ditha Nurcahya Avianty on 20/07/22.
//

import Foundation
import WatchConnectivity

class ViewModelWatch: NSObject, WCSessionDelegate, ObservableObject {
    
    var wcSession: WCSession
    
    // Init session and activate watch connectivity
    init(session: WCSession = .default){
        self.wcSession = session
        super.init()
        self.wcSession.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //
    }
    
}

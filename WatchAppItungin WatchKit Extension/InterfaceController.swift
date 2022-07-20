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
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()

    }
    
}

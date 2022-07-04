//
//  SpeechViewController.swift
//  iOSApp
//
//  Created by Hastomi Riduan Munthe on 04/07/22.
//

import UIKit
import Speech
import SwiftUI

class SpeechViewController: UIViewController {
    var swiftUISpeech = SwiftUISpeech()
    
    @IBOutlet weak var frameSpeech: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = ContentView().environmentObject(swiftUISpeech)
        let vc = UIHostingController(rootView: contentView)
        vc.view.frame = frameSpeech.frame
        view.addSubview(vc.view)
        
        

    }
    

}

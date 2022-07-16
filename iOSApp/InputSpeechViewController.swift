//
//  InputSpeechViewController.swift
//  iOSApp
//
//  Created by Hastomi Riduan Munthe on 16/07/22.
//

import UIKit
import Speech
import SwiftUI

class InputSpeechViewController: UIViewController {
    @IBOutlet var textFieldSpeech: UITextField!
    @IBOutlet var titleSpeech: UITextField!
    @IBOutlet var priceSpeech: UITextField!
    
    var swiftUISpeech = SwiftUISpeech()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        let contentView = ContentView().environmentObject(swiftUISpeech)
//        let vc = UIHostingController(rootView: contentView)
//        vc.view.frame = textFieldSpeech.frame
//        view.addSubview(vc.view)
        
        
    }
    
    
}




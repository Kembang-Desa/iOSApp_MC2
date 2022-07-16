//
//  SpeechViewController.swift
//  iOSApp
//
//  Created by Hastomi Riduan Munthe on 04/07/22.
//

import UIKit
import Speech
import SwiftUI
import Combine

class SpeechViewController: UIViewController {
    var swiftUISpeech = SwiftUISpeech()
    var buttonState = false
    var outputText = ""
    private var cancellable : AnyCancellable!
    
    @IBOutlet weak var frameSpeech: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let delegate = ContentViewDelegate()
        self.tabBarController?.tabBar.isHidden = true

        
        let contentView = ContentView(delegate: delegate).environmentObject(swiftUISpeech)
        let vc = UIHostingController(rootView: contentView)
    
        vc.view.frame = frameSpeech.frame
        view.addSubview(vc.view)
        
        self.cancellable = delegate.$speechText.sink { output in
            print("ini uikit \(output)")
            self.outputText = output
        }
        
//configureItems()
//        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
//    private func configureItems() {
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .done,
//            target: self,
//            action: nil)
//    }
    
    @IBAction func goTonextpage(_ sender: Any) {
        if(!self.outputText.isEmpty){
            performSegue(withIdentifier: "goToNextPage", sender: nil)
        }
    }
    

}

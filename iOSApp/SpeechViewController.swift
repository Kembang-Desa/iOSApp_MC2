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
        var title = ""
        var price = 0.0
        var category = ""
        let output = outputText
        
        if(!self.outputText.isEmpty){
            var splitted = self.outputText.components(separatedBy: " ")
            if let idSpend = splitted.firstIndex(of: "spent"){
                print(idSpend)
                if(idSpend+1 < splitted.count){
                    print(splitted[idSpend+1])
                    price = Double(splitted[idSpend+1]) ?? 0
                }
            }
            if let idFor = splitted.firstIndex(of: "for"){
                print(idFor)
                if(idFor+1 < splitted.count){
                    print(splitted[idFor+1])
                    title = splitted[idFor+1]
                }
            }
            if let idCategory = splitted.firstIndex(of: "category"){
                print(idCategory)
                if(idCategory+1 < splitted.count){
                    print(splitted[idCategory+1])
                    category = splitted[idCategory+1]
                }
            }
            
            
            let displayVC : InputSpeechViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "goToNextPage") as! InputSpeechViewController
//            performSegue(withIdentifier: "goToNextPage", sender: nil)
            displayVC.priceT = price
            displayVC.titleT = title
            displayVC.categoryT = category
            displayVC.outputT = output
            
            
            self.navigationController?.pushViewController(displayVC, animated: false)
            
            self.dismiss(animated: true)
        }
    }


}


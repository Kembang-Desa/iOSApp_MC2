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
    
    @IBOutlet weak var bebasSih: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = ContentView().environmentObject(swiftUISpeech)
        let vc = UIHostingController(rootView: contentView)
        vc.view.frame = bebasSih.frame
        view.addSubview(vc.view)
        
        
//        present(vc, animated: true)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

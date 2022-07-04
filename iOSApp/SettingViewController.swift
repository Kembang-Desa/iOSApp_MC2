//
//  SettingViewController.swift
//  iOSApp
//
//  Created by Hastomi Riduan Munthe on 03/07/22.
//

import UIKit
import UserNotifications

class SettingViewController: UIViewController {
    
    @IBOutlet weak var pickerViewLanguage: UIButton!
    
    @IBOutlet weak var stateSwitch: UISwitch!
    
    func notify(hour: Int, minute: Int){
        let content = UNMutableNotificationContent()
        content.title = "Your Financial Friend"
        content.body = "Track Your financial today!"
        
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //TODO: Step 2c - Add content & trigger to the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest (identifier: uuidString,content: content, trigger: trigger)
        
        //TODO: Step 2d - Add request to notification center
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
            }
        }
    }
    @IBAction func switchTime(_ sender: UISwitch) {
        if stateSwitch.isOn == true {
            notify(hour: 21, minute: 00)
            print("berhasil")
        }
        else {
            print("gagal")
            //delete notification
        }
    }
    
    var languagePickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func requestPermission(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
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

//
//  AddTransactionViewController.swift
//  iOSApp
//
//  Created by Ditha Nurcahya Avianty on 03/07/22.
//

import UIKit

class AddTransactionViewController: UIViewController {
    
    @IBOutlet weak var receiptImage: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    
    var titleT: String = ""
    var priceT: Double = 0
    var categoryT: String = ""
    var imageT = UIImage()
    
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    let formatter = DateFormatter()
    let formatter1 = DateFormatter()
    
    var pickerCategory: [String] = [String]()
    
    let appDelegate = UIApplication.shared.delegate! as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.tabBarController?.tabBar.isHidden = true
        
        // Do any additional setup after loading the view.
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        if imageIsNullOrNot(imageName: imageT){
            receiptImage.image = imageT
        }else{
            receiptImage.image = UIImage(systemName: "list.bullet.rectangle.portrait.fill")
        }
        
        pickerCategory = ["Needs","Wants","Savings"]
        priceTextField.text = String(priceT)
        
        if dateTextField.text!.isEmpty && timeTextField.text!.isEmpty{
            formatter.dateStyle = .medium
            dateTextField.text = formatter.string(from: datePicker.date)
            
            formatter1.timeStyle = .short
            timeTextField.text = formatter1.string(from: timePicker.date)
        }
        
        createDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        createTimePicker()
        timePicker.preferredDatePickerStyle = .wheels
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func imageIsNullOrNot(imageName : UIImage)-> Bool
    {
        
        let size = CGSize(width: 0, height: 0)
        if (imageName.size.width == size.width)
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDatePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        dateTextField.inputAccessoryView = toolbar
        
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    
    @objc func doneDatePressed(){
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
    }
    
    func createTimePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneTimePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        timeTextField.inputAccessoryView = toolbar
        
        timeTextField.inputView = timePicker
        timePicker.datePickerMode = .time
    }
    
    
    @objc func doneTimePressed(){
        formatter1.timeStyle = .short
        
        timeTextField.text = formatter1.string(from: timePicker.date)
        self.view.endEditing(true)
        
    }
    
    
    @IBAction func didSave(_ sender: Any) {
        //append data
        titleT = titleTextField.text ?? ""
        priceT = Double(priceTextField.text!) ?? 0
        
        
        print(titleT)
        print(priceT)
        print(categoryT)
        
        //        let displayVC : ReportViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "reportID") as! ReportViewController
        //
        //        self.navigationController?.pushViewController(displayVC, animated: false)
        
        let alert = UIAlertController(title: "Success", message: "Successfully saved Transaction", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        self.tabBarController?.selectedIndex = 1
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.popToRootViewController(animated: false)
    }
    
}

extension AddTransactionViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerCategory.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerCategory[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("set \(pickerCategory[row])")
        categoryT = pickerCategory[row]
    }
}

//extension AddTransactionViewController: UITabBarDelegate{
//
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        self.navigationController?.popToRootViewController(animated: false)
//    }
//}

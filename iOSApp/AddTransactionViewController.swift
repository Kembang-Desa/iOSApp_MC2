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
    
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    let formatter = DateFormatter()
    
    var pickerCategory: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        pickerCategory = ["Needs","Wants","Savings"]
        print(priceT)
        priceTextField.text = String(priceT)
        dateTextField.text = formatter.string(from: Date.now)
        
        createDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        
        
        createTimePicker()
        timePicker.preferredDatePickerStyle = .wheels
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
        formatter.timeStyle = .short
        
        
        timeTextField.text = formatter.string(from: timePicker.date)
        self.view.endEditing(true)
        
    }
    
    
    @IBAction func didSave(_ sender: Any) {
        //append data
        titleT = titleTextField.text ?? ""
        priceT = Double(priceTextField.text!) ?? 0
        
        
        print(titleT)
        print(priceT)
        print(categoryT)
        
        let displayVC : ReportViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "reportID") as! ReportViewController
        
        self.navigationController?.pushViewController(displayVC, animated: false)
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

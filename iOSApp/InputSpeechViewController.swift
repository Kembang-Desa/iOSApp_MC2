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
    @IBOutlet var labelFieldSpeech: UILabel!
    @IBOutlet var titleSpeech: UITextField!
    @IBOutlet var priceSpeech: UITextField!
    @IBOutlet weak var dateTextField: UITextField!

    @IBOutlet var categorySpeech: UIPickerView!
    
    //    var titleT: String?
    
    var text : String?
    var outputT : String?
    
    var titleT: String = ""
    var priceT: Double = 0
    //    var priceT: Double?
    var categoryT: String = "Needs"
    //    var categoryT: String?
    
    let datePicker = UIDatePicker()
    //    let timePicker = UIDatePicker()
    let formatter = DateFormatter()
    //    let formatter1 = DateFormatter()
    
    var swiftUISpeech = SwiftUISpeech()
    
    var categoryPicker: [String] = [String]()
    
    let appDelegate = UIApplication.shared.delegate! as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if outputT != nil {
//            textFieldSpeech.text = outputT
//        }
        
        print("ini hasil speech \(outputT)")
        print("ini nilai categoryT \(categoryT)")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.tabBarController?.tabBar.isHidden = true
        
        categorySpeech.delegate = self
        categorySpeech.dataSource = self
        
        if dateTextField.text!.isEmpty{
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            dateTextField.text = formatter.string(from: datePicker.date)
            
            titleSpeech.text = self.titleT
            // categorySpeech. = as! UIPickerViewDelegate
            priceSpeech.text = "\(priceT )"
            categoryPicker = ["Needs","Wants","Savings"]
            labelFieldSpeech.text = self.outputT
            
            
            //        categorySpeech.selectedRow()
            categorySpeech.selectRow(categoryPicker.firstIndex(of: categoryT.capitalized ) ?? 0, inComponent: 0, animated: false)
            //        let contentView = ContentView().environmentObject(swiftUISpeech)
            //        let vc = UIHostingController(rootView: contentView)
            //        vc.view.frame = textFieldSpeech.frame
            //        view.addSubview(vc.view)
            
            
        }
        
    }
    
    
    func getBudget() -> Budget?{
        var budgets: [Budget] = []
        
        do {
            budgets = try context.fetch(Budget.fetchRequest())
        }catch{
            print("Error while fetch budgets")
        }
        
        for budget in budgets{
            if(budget.name == categoryT){
                return budget
            }
        }
        return nil
    }
    
    func saveTransactions(budget:Budget, timestamp: Date, name:String, price: Double, type: String){
        
        let transaction = Transaction(context: context)
        transaction.uuid = UUID()
        transaction.timestamp = timestamp
        transaction.name = name
        transaction.price = price
        transaction.type = type
//        transaction.path_data = path_data
        
        budget.addToTransactions(transaction)
        
        if(context.hasChanges){
            do {
                try context.save()
                print("transaction saving.....")
            }catch{
                print("error while saving transactions \(error)")
            }
        }else{
            print("context not changes")
        }
        
    }
    @IBAction func didSave(_ sender: Any) {
        
        //append data
        titleT = titleSpeech.text ?? ""
        priceT = Double(priceSpeech.text!) ?? 0
        
        
        print(titleT)
        print(priceT)
        print(categoryT)
        
        if let budget = getBudget() {
            saveTransactions(budget: budget, timestamp: datePicker.date, name: titleT, price: priceT, type: "Hello")
        }
        
        //        let displayVC : ReportViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "reportID") as! ReportViewController
        //
        //        self.navigationController?.pushViewController(displayVC, animated: false)
        
        let alert = UIAlertController(title: "Success", message: "Successfully saved Transaction", preferredStyle: UIAlertController.Style.alert)
        
        let okActionButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { _ in
            self.tabBarController?.selectedIndex = 1
            self.tabBarController?.tabBar.isHidden = false
            self.navigationController?.popToRootViewController(animated: false)
        }
        alert.addAction(okActionButton)
        self.present(alert, animated: true, completion: nil)
        
    }
}

extension InputSpeechViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryPicker[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("set \(categoryPicker[row])")
        categoryT = categoryPicker[row]
    }
    
}

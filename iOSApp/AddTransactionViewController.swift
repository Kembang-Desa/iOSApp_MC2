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
    
    var titleT: String = ""
    var priceT: Double = 0
    var categoryT: String = ""
    
    let viewModel: DataTransactionViewModel = DataTransactionViewModel()
    
    var pickerCategory: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        pickerCategory = ["Needs","Wants","Savings"]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func didSave(_ sender: Any) {
        //append data
        titleT = titleTextField.text ?? ""
        priceT = Double(priceTextField.text!) ?? 0
        
        
        print(titleT)
        print(priceT)
        print(categoryT)
        self.viewModel.addTransaction(transTitle: titleT, transPrice: priceT, transCategory: categoryT)
        print("saved!")
        
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

//
//  DashboardViewController.swift
//  iOSApp
//
//  Created by Ditha Nurcahya Avianty on 02/07/22.
//

import UIKit

struct InputTransactionMethod {
    var title: String?
    var imageName: String?
}

struct Overview {
    var imageName: String?
    var title: String?
    var balance: Int?
    var bgColor: String?
}

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var percentageCollectionView: UICollectionView!
    @IBOutlet weak var inputTransactionTable: UITableView!
    
    var dataInputMethod = [InputTransactionMethod]()
    var dataOverview = [Overview]()
    
    func initDataInputMethod(){
        let scan = InputTransactionMethod(title: "Scan Receipt", imageName: "scanIcon")
        let speech = InputTransactionMethod(title: "Speech", imageName: "speechIcon")
        let manual = InputTransactionMethod(title: "Manual", imageName: "manualIcon")
        
        dataInputMethod.append(scan)
        dataInputMethod.append(speech)
        dataInputMethod.append(manual)
    }
    
    func initOverview(){
        let cashout = Overview(imageName: "calendar", title: "Total Cash Out", balance: 100000, bgColor: ".brown")
        let needs = Overview(imageName: "calendar", title: "Needs", balance: 600000, bgColor: ".brown")
        let wants = Overview(imageName: "calendar", title: "Wants", balance: 200000, bgColor: ".brown")
        let savings = Overview(imageName: "calendar", title: "Savings", balance: 150000, bgColor: ".brown")
        
        dataOverview.append(cashout)
        dataOverview.append(needs)
        dataOverview.append(wants)
        dataOverview.append(savings)
        
        percentageCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "InputTableViewCell", bundle: nil)
        inputTransactionTable.register(nib, forCellReuseIdentifier: "inputCell")
        
        let nib1 = UINib(nibName: "PercentageCollectionViewCell", bundle: nil)
        percentageCollectionView.register(nib1, forCellWithReuseIdentifier: "percentageCollectionViewCell")
        // Do any additional setup after loading the view.
        
         
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: view.frame.size.width/3, height: view.frame.size.height/3)
//
//        percentageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        
        
        percentageCollectionView.delegate = self
        percentageCollectionView.dataSource = self
        percentageCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
//        percentageCollectionView.backgroundColor = .blue
        
       
        
        inputTransactionTable.delegate = self
        inputTransactionTable.dataSource = self

        // Do any additional setup after loading the view.
        initDataInputMethod()
        initOverview()
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

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    //collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 95)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(dataOverview.count)
        return dataOverview.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = percentageCollectionView.dequeueReusableCell(withReuseIdentifier: "percentageCollectionViewCell", for: indexPath) as!PercentageCollectionViewCell
        
        cell.backgroundColor = .systemTeal
        cell.layer.cornerRadius = 10
        
        let input = dataOverview[indexPath.row]
        cell.imgPercentage?.image = UIImage(systemName: input.imageName!)
        cell.labelCategory.text = input.title
        cell.labelCategory.textColor = .white
        cell.labelTotalBalance.text =  "Rp. \(input.balance!)"
        cell.labelTotalBalance.textColor = .white
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("selected cell \(indexPath.row)")
//
//
//    }
    
    //table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = inputTransactionTable.dequeueReusableCell(withIdentifier: "inputCell") as!InputTableViewCell
        
        let input = dataInputMethod[indexPath.row]
        cell.labelInputTransaction?.text = input.title
        cell.imgInputTransaction?.image = UIImage(named: input.imageName!)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell \(indexPath.row)")
        
        if indexPath.row == 0 {
            navigationController?.pushViewController(ScanViewController(), animated: false)
        }else if indexPath.row == 1 {
//            speech
            
        }else if indexPath.row == 2 {
            //manual
            let displayVC : AddTransactionViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "transactionID") as! AddTransactionViewController
            
            self.navigationController?.pushViewController(displayVC, animated: false)
        }
    }
    
}


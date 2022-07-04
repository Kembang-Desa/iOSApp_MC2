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
    
    var colorList = [UIColor(red: (143/255), green: 0, blue: 0, alpha: 1),UIColor(red: (45/255), green: (92/255), blue: (108/255), alpha: 1),UIColor(red: (89/255), green: (28/255), blue: (102/255), alpha: 1),UIColor(red: (50/255), green: (90/255), blue: (38/255), alpha: 1)]

    
    func initDataInputMethod(){
        let scan = InputTransactionMethod(title: "Scan Receipt", imageName: "scanIcon")
        let speech = InputTransactionMethod(title: "Speech", imageName: "speechIcon")
        let manual = InputTransactionMethod(title: "Manual", imageName: "manualIcon")
        
        dataInputMethod.append(scan)
        dataInputMethod.append(speech)
        dataInputMethod.append(manual)
    }
    
    func initOverview(){
        let cashout = Overview(imageName: "arrow.up.circle.fill", title: "Total Cash Out", balance: 100000, bgColor: ".brown")
        let needs = Overview(imageName: "takeoutbag.and.cup.and.straw.fill", title: "Needs", balance: 600000, bgColor: ".brown")
        let wants = Overview(imageName: "bag.fill", title: "Wants", balance: 200000, bgColor: ".brown")
        let savings = Overview(imageName: "heart.fill", title: "Savings", balance: 150000, bgColor: ".brown")
        
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

}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    //collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 90)
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
        cell.imgPercentage?.tintColor = .white
        cell.labelCategory.text = input.title
        cell.labelCategory.textColor = .white
        cell.labelTotalBalance.text =  "Rp. \(input.balance!)"
        cell.labelTotalBalance.textColor = .white
        
        cell.backgroundColor = colorList[indexPath.row]
        
        return cell
    }
    
    
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
            //speech
            let displayVC : SpeechViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "speechID") as! SpeechViewController
            
            self.navigationController?.pushViewController(displayVC, animated: false)
        }else if indexPath.row == 2 {
            //manual
            let displayVC : AddTransactionViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "transactionID") as! AddTransactionViewController
            
            self.navigationController?.pushViewController(displayVC, animated: false)
        }
    }
    
}

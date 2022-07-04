//
//  DashboardViewController.swift
//  iOSApp
//
//  Created by Ditha Nurcahya Avianty on 02/07/22.
//

import UIKit

class DashboardViewController: UIViewController {

    
    @IBOutlet weak var percentageCollectionView: UICollectionView!
    @IBOutlet weak var inputTransactionTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "InputTableViewCell", bundle: nil)
        inputTransactionTable.register(nib, forCellReuseIdentifier: "inputCell")
        
        let nib1 = UINib(nibName: "PercentageCollectionViewCell", bundle: nil)
        percentageCollectionView.register(nib1, forCellWithReuseIdentifier: "percentageCollectionViewCell")
        // Do any additional setup after loading the view.
        
        
        
        percentageCollectionView.delegate = self
        percentageCollectionView.dataSource = self
        
       
        
        inputTransactionTable.delegate = self
        inputTransactionTable.dataSource = self

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

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = percentageCollectionView.dequeueReusableCell(withReuseIdentifier: "percentageCollectionViewCell", for: indexPath) as!PercentageCollectionViewCell
        
        cell.imgPercentage.image = UIImage(systemName: "calendar")
        cell.labelCategory.text = "Needs"
        cell.labelTotalBalance.text = "Rp100.000"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = inputTransactionTable.dequeueReusableCell(withIdentifier: "inputCell") as!InputTableViewCell
        
        cell.labelInputTransaction.text = "Scan Receipt"
        cell.labelInputTransaction.text = "Speech"
        cell.imgInputTransaction.image = UIImage(systemName: "calendar")
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell \(indexPath.row)")
        
        if indexPath.row == 0 {
            navigationController?.pushViewController(ScanViewController(), animated: false)
            
        }
    }
    
}


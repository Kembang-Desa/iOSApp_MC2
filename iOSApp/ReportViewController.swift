//
//  ReportViewController.swift
//  iOSApp
//
//  Created by Ditha Nurcahya Avianty on 02/07/22.
//

import UIKit

class ReportViewController: UIViewController {

    @IBOutlet weak var transactionTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TransactionTableViewCell", bundle: nil)
        transactionTable.register(nib, forCellReuseIdentifier: "transactionCell")
        // Do any additional setup after loading the view.
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        transactionTable.delegate = self
        transactionTable.dataSource = self
        
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

extension ReportViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionTable.dequeueReusableCell(withIdentifier: "transactionCell") as!TransactionTableViewCell
        
        cell.titleLabel.text = "title"
        cell.priceLabel.text = "100000"
        
        return cell
    }
    
    
}

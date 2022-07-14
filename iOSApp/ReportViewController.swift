//
//  ReportViewController.swift
//  iOSApp
//
//  Created by Ditha Nurcahya Avianty on 02/07/22.
//

import UIKit
import CoreData

class ReportViewController: UIViewController {

    @IBOutlet weak var transactionTable: UITableView!
    var transactions: [Transaction] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TransactionTableViewCell", bundle: nil)
        transactionTable.register(nib, forCellReuseIdentifier: "transactionCell")
        // Do any additional setup after loading the view.
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        transactionTable.delegate = self
        transactionTable.dataSource = self
        
        fetchTransactions()
        transactionTable.reloadData()
        
        
    }
    
    func getBudget(category: String) -> Budget?{
        var budgets: [Budget] = []

        do {
            budgets = try context.fetch(Budget.fetchRequest())
        }catch{
            print("Error while fetch budgets")
        }
        
        for budget in budgets{
            if(budget.name == category){
                return budget
            }
        }
        return nil
    }
    
    func fetchTransactions(){
        
        if let budget = getBudget(category: "Needs"){
            
            let request: NSFetchRequest<Transaction> = Transaction.fetchRequest()
            request.predicate = NSPredicate(format: "(price > 0) AND (budget = %@)", budget)
            request.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
            
            do {
                transactions = try context.fetch(request)
            }catch{
                print("Error while fetch transactions")
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
    
    override func viewWillAppear(_ animated: Bool) {
        fetchTransactions()
        transactionTable.reloadData()
    }

}


extension ReportViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionTable.dequeueReusableCell(withIdentifier: "transactionCell") as!TransactionTableViewCell
        
        let transaction = transactions[indexPath.row]
        
        cell.titleLabel.text = transaction.name
        
        let formatter = DateFormatter()
        let datePicker = UIDatePicker()
        formatter.dateStyle = .medium
        cell.dateTimeLabel.text = formatter.string(from: datePicker.date)
        
        cell.priceLabel.text = String(transaction.price)
        
        return cell
    }
    
    
}

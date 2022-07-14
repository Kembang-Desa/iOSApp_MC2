//
//  DashboardViewController.swift
//  iOSApp
//
//  Created by Ditha Nurcahya Avianty on 02/07/22.
//

import UIKit
import CoreData

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

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func loadAllTransactions(budget: Budget) -> [Transaction] {
        let request: NSFetchRequest<Transaction> = Transaction.fetchRequest()
        request.predicate = NSPredicate(format: "(price > 0) AND (budget = %@)", budget)
        request.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
        
        var fetched: [Transaction] = []
        
        do {
            fetched = try context.fetch(request)
        }catch{
            print("error fetching transactions")
        }
        
        return fetched
    }
    
    
    func saveTransactions(){
        var budgets: [Budget] = []
        
        do {
            budgets = try context.fetch(Budget.fetchRequest())
            print(budgets)
        }catch{
            print("Error while fetch budgets")
        }
        
        print("load single budgets \(budgets[0])")
        
        let budget = budgets[0]
        
        let transaction1 = Transaction(context: context)
        transaction1.uuid = UUID()
        transaction1.timestamp = Date.now
        transaction1.name = "Beli Bakso"
        transaction1.price = 1000000.0
        transaction1.type = "Image"
        transaction1.path_data = "path data"

        let transaction2 = Transaction(context: context)
        transaction2.uuid = UUID()
        transaction2.timestamp = Date.now
        transaction2.name = "Beli Bakso"
        transaction2.price = 1000000.0
        transaction2.type = "Image"
        transaction2.path_data = "path data"

        let transaction3 = Transaction(context: context)
        transaction3.uuid = UUID()
        transaction3.timestamp = Date.now
        transaction3.name = "Beli Bakso"
        transaction3.price = 1000000.0
        transaction3.type = "Image"
        transaction3.path_data = "path data"

        let transaction4 = Transaction(context: context)
        transaction4.uuid = UUID()
        transaction4.timestamp = Date.now
        transaction4.name = "Beli Bakso"
        transaction4.price = 1000000.0
        transaction4.type = "Image"
        transaction4.path_data = "path data"
        

        var transactions: [Transaction] = []
        transactions.append(transaction1)
        transactions.append(transaction2)
        transactions.append(transaction3)
        transactions.append(transaction4)
        
        budget.addToTransactions(transaction1)
        budget.addToTransactions(transaction2)
        budget.addToTransactions(transaction3)
        budget.addToTransactions(transaction4)
        
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
    
    func fetchTransactions(){
        var transactions: [Transaction] = []
        
        do {
            transactions = try context.fetch(Transaction.fetchRequest())
            print("load all \(transactions)")
            print("size data \(transactions.count)")
            
        }catch{
            print("Error while fetch transactions")
        }
    }
    
    
    func saveUser(){
        let user = User(context: context)
        user.income = 1000000.0
        user.avatar = "ini avatar"
        user.name = "John Doe"
        
        do {
            try context.save()
        }catch{
            print("error while saving data")
        }
    }
    
    func saveBudget(){
        let budget1 = Budget(context: context)
        budget1.name = "Needs"
        budget1.max_limit = 500000
        
        let budget2 = Budget(context: context)
        budget2.name = "Wants"
        budget2.max_limit = 600000
        
        let budget3 = Budget(context: context)
        budget3.name = "Savings"
        budget3.max_limit = 700000
        
        
        do {
            try context.save()
        }catch{
            print("error while saving budget")
        }
    }
    
    func fetchBudget(){
        var budgets: [Budget] = []
        
        do {
            budgets = try context.fetch(Budget.fetchRequest())
            print("load all budgets \(budgets)")
        }catch{
            print("Error while fetch budgets")
        }
    }
    
    func fetchUser(){
        var users: [User] = []
        
        do {
            users = try context.fetch(User.fetchRequest())
            print(users)
        }catch{
            print("error while fetch users")
        }
    }
    
    
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
        
        saveUser()
//        fetchUser()
        saveBudget()
//        fetchBudget()
//        saveTransactions()
//        fetchTransactions()
         
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

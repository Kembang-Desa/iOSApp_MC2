//
//  DataTransactionViewModel.swift
//  iOSApp
//
//  Created by Ditha Nurcahya Avianty on 04/07/22.
//

import Foundation

class DataTransactionViewModel {
    
    var items: [DataTransaction] = [] {
        didSet{
            saveTransaction()
        }
    }

    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: "TransactionList"),
            let savedTransaction = try? JSONDecoder().decode([DataTransaction].self, from: data)
        else { return }
        
        self.items = savedTransaction
    }
    
    func addTransaction(transTitle:String, transPrice:Double, transCategory:String) {
        
        let newTransaction = DataTransaction(transtitle: transTitle, transPrice: transPrice, transCategory: transCategory)
        
        items.append(newTransaction)
        print("terappend")
    }
    
    func saveTransaction() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "Transactionlist")
        }
    }
}

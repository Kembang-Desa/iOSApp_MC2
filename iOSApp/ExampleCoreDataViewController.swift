//
//  ExampleCoreDataViewController.swift
//  iOSApp
//
//  Created by Rivaldo Fernandes on 04/07/22.
//

import UIKit

class ExampleCoreDataViewController: UIViewController {

    //1. create reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    //Todo create arrayobject
    var userList: [User] = []
    
    var transactionList: [Transaction] = []
    
    var catList: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
//        saveDataCat()
//        saveData()
//        saveDataTrans()
        
        saveMultipleDataCat()
        saveMultipleUser()
        savemultipleTransaction()
        
    }
    
    func saveMultipleDataCat(){
        let newCat1 = Category(context: context)
        newCat1.name = "Wants"
        newCat1.hex_color = 10.00
        newCat1.limit = 100000000
        let newCat2 = Category(context: context)
        newCat2.name = "Needs"
        newCat2.hex_color = 10.00
        newCat2.limit = 100000000
        let newCat3 = Category(context: context)
        newCat3.name = "Savings"
        newCat3.hex_color = 10.00
        newCat3.limit = 100000000
        
        do {
            try context.save()
        }catch {
            print("Error Cat")
        }
    }
    
    func saveMultipleUser(){
        let newUser1 = User(context: context)
        newUser1.uuid = UUID()
        newUser1.name = "Valdo"
        newUser1.avatar = "hahaha"
        newUser1.income = 100000.000
        
        let newUser2 = User(context: context)
        newUser2.uuid = UUID()
        newUser2.name = "Valdo"
        newUser2.avatar = "hahaha"
        newUser2.income = 100000.000
        
        let newUser3 = User(context: context)
        newUser3.uuid = UUID()
        newUser3.name = "Valdo"
        newUser3.avatar = "hahaha"
        newUser3.income = 100000.000
        
        do {
            try context.save()
        }catch {
            print("Error Cat")
        }
    }
    
    func savemultipleTransaction(){
        let newUser = User(context: context)
        newUser.uuid = UUID()
        newUser.name = "Valdo"
        newUser.avatar = "hahaha"
        newUser.income = 100000.000

        let newCat = Category(context: context)
        newCat.name = "Wants"
        newCat.hex_color = 10.00
        newCat.limit = 100000000


        let newTrans1 = Transaction(context: context)
        newTrans1.uuid = UUID()
        newTrans1.datetime = Date.now
        newTrans1.title = "Beli Kopi"
        newTrans1.origin_user = newUser
        newTrans1.current_limit = 10000.00
        newTrans1.origin_category = newCat
        newTrans1.price = 10000
        
        let newTrans2 = Transaction(context: context)
        newTrans1.uuid = UUID()
        newTrans1.datetime = Date.now
        newTrans1.title = "Beli Kopi"
        newTrans1.origin_user = newUser
        newTrans1.current_limit = 10000.00
        newTrans1.origin_category = newCat
        newTrans1.price = 10000
        
        let newTrans3 = Transaction(context: context)
        newTrans1.uuid = UUID()
        newTrans1.datetime = Date.now
        newTrans1.title = "Beli Kopi"
        newTrans1.origin_user = newUser
        newTrans1.current_limit = 10000.00
        newTrans1.origin_category = newCat
        newTrans1.price = 10000
        
        let newTrans4 = Transaction(context: context)
        newTrans1.uuid = UUID()
        newTrans1.datetime = Date.now
        newTrans1.title = "Beli Kopi"
        newTrans1.origin_user = newUser
        newTrans1.current_limit = 10000.00
        newTrans1.origin_category = newCat
        newTrans1.price = 10000
        
        do {
            try context.save()
        }catch {
            print("Error Trans")
        }
    }
    
    
    @IBAction func btnPressed(_ sender: Any) {
        print("Hello")
        fetchUser()
        
    }
        func fetchUser(){

        //fetch need handle
            
        do {
            catList = try context.fetch(Category.fetchRequest())
            print(catList)
            print("Fetch cat")
        }catch{
            print("error")
        }
            
        do {
            userList = try context.fetch(User.fetchRequest())
            print(userList)
            print("Fetch user")
        }catch{
            print("error")
        }

        do {
            transactionList = try context.fetch(Transaction.fetchRequest())
            print(transactionList)
            print("Fetch trans")
        }catch{
            print("error")
        }
    }

}

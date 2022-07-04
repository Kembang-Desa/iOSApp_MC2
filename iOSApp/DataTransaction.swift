//
//  Transaction.swift
//  iOSApp
//
//  Created by Ditha Nurcahya Avianty on 04/07/22.
//

import Foundation

struct DataTransaction: Codable{
    
    //var id:String?

    var transTitle: String = ""
    var transPrice: Double = 0
    var transCategory: String = ""
    
    init(transtitle:String, transPrice:Double,transCategory:String){
        self.transTitle = transtitle
        self.transPrice = transPrice
        self.transCategory = transCategory
    }
    
}

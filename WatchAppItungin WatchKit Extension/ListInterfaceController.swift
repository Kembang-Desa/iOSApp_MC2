//
//  ListInterfaceController.swift
//  WatchAppItungin WatchKit Extension
//
//  Created by Hastomi Riduan Munthe on 20/07/22.
//

import WatchKit
import Foundation


class ListInterfaceController: WKInterfaceController {
    
    @IBOutlet var tableView: WKInterfaceTable!
    
    let title = ["Undone Transaction 1", "Undone Transaction 2", "Undone Transaction 2"]
    let price = ["1000", "2000", "3000"]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        loadTableData()
        //loadTableData2()
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    private func loadTableData() {
        
        tableView.setNumberOfRows(title.count, withRowType: "RowController")
        for (index, rowModelPrice) in title.enumerated() {
            print(title.count)
            if let rowController = tableView.rowController(at: index) as? RowController {
                rowController.rowTitle.setText(rowModelPrice)
            }
        }
        for (index, rowModelPrice) in price.enumerated() {
            print(price.count)
            if let rowController = tableView.rowController(at: index) as? RowController {
                rowController.rowPrice.setText(rowModelPrice)
            }
        }
        
    }
    
//    private func loadTableData2() {
//
//        tableView.setNumberOfRows(price.count, withRowType: "RowController")
//        for (index, rowModelPrice) in price.enumerated() {
//            print("berhasilOK")
//            if let rowController = tableView.rowController(at: index) as? RowController {
//                rowController.rowPrice.setText(rowModelPrice)
//            }
//        }
//
//    }
}

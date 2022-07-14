//
//  Transaction+CoreDataProperties.swift
//  iOSApp
//
//  Created by Rivaldo Fernandes on 14/07/22.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var timestamp: Date?
    @NSManaged public var uuid: UUID?
    @NSManaged public var path_data: String?
    @NSManaged public var type: String?
    @NSManaged public var budget: Budget?

}

extension Transaction : Identifiable {

}

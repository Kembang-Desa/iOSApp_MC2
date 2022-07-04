//
//  Transaction+CoreDataProperties.swift
//  iOSApp
//
//  Created by Ditha Nurcahya Avianty on 04/07/22.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var current_limit: Double
    @NSManaged public var datetime: Date?
    @NSManaged public var price: Double
    @NSManaged public var title: String?
    @NSManaged public var uuid: UUID?

}

extension Transaction : Identifiable {

}

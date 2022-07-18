//
//  Transaction+CoreDataProperties.swift
//  iOSApp
//
//  Created by Ditha Nurcahya Avianty on 18/07/22.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var name: String?
    @NSManaged public var path_data: Data?
    @NSManaged public var price: Double
    @NSManaged public var timestamp: Date?
    @NSManaged public var type: String?
    @NSManaged public var uuid: UUID?
    @NSManaged public var budget: Budget?

}

extension Transaction : Identifiable {

}

//
//  Transaction+CoreDataProperties.swift
//  iOSApp
//
//  Created by Rivaldo Fernandes on 04/07/22.
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
    @NSManaged public var origin_category: Category?
    @NSManaged public var origin_user: User?
    

}

extension Transaction : Identifiable {

}

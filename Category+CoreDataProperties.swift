//
//  Category+CoreDataProperties.swift
//  iOSApp
//
//  Created by Rivaldo Fernandes on 04/07/22.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var hex_color: Float
    @NSManaged public var limit: Double
    @NSManaged public var name: String?
    @NSManaged public var transaction: NSSet?
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }
    

}

// MARK: Generated accessors for transaction
extension Category {

    @objc(addTransactionObject:)
    @NSManaged public func addToTransaction(_ value: Transaction)

    @objc(removeTransactionObject:)
    @NSManaged public func removeFromTransaction(_ value: Transaction)

    @objc(addTransaction:)
    @NSManaged public func addToTransaction(_ values: NSSet)

    @objc(removeTransaction:)
    @NSManaged public func removeFromTransaction(_ values: NSSet)

}

extension Category : Identifiable {

}

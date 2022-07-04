//
//  User+CoreDataProperties.swift
//  iOSApp
//
//  Created by Rivaldo Fernandes on 04/07/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var avatar: String?
    @NSManaged public var income: Double
    @NSManaged public var name: String?
    @NSManaged public var uuid: UUID?
    @NSManaged public var transaction: NSSet?
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }
    
    public var wrappedAvatar: String {
        avatar ?? "Unknown Avatar"
    }
    
    public var wrappedUuid: UUID {
        uuid ?? UUID()
    }

}

// MARK: Generated accessors for transaction
extension User {

    @objc(addTransactionObject:)
    @NSManaged public func addToTransaction(_ value: Transaction)

    @objc(removeTransactionObject:)
    @NSManaged public func removeFromTransaction(_ value: Transaction)

    @objc(addTransaction:)
    @NSManaged public func addToTransaction(_ values: NSSet)

    @objc(removeTransaction:)
    @NSManaged public func removeFromTransaction(_ values: NSSet)

}

extension User : Identifiable {

}

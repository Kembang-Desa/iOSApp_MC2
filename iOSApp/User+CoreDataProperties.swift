//
//  User+CoreDataProperties.swift
//  iOSApp
//
//  Created by Rivaldo Fernandes on 01/07/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var name: String?
    @NSManaged public var avatar: String?
    @NSManaged public var income: Double

}

extension User : Identifiable {

}

//
//  User+CoreDataProperties.swift
//  iOSApp
//
//  Created by Ditha Nurcahya Avianty on 18/07/22.
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

}

extension User : Identifiable {

}

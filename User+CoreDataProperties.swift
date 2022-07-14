//
//  User+CoreDataProperties.swift
//  iOSApp
//
//  Created by Rivaldo Fernandes on 14/07/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var income: Double
    @NSManaged public var avatar: String?

}

extension User : Identifiable {

}

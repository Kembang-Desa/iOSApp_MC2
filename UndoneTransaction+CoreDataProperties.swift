//
//  UndoneTransaction+CoreDataProperties.swift
//  iOSApp
//
//  Created by Ditha Nurcahya Avianty on 19/07/22.
//
//

import Foundation
import CoreData


extension UndoneTransaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UndoneTransaction> {
        return NSFetchRequest<UndoneTransaction>(entityName: "UndoneTransaction")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var audio_data: Data?
    @NSManaged public var timestamp: Date?
    @NSManaged public var title: String?
    @NSManaged public var price: Double

}

extension UndoneTransaction : Identifiable {

}

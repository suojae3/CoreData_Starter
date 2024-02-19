//
//  UserMO+CoreDataProperties.swift
//  CoreData_Starter
//
//  Created by ㅣ on 2/19/24.
//
//

import Foundation
import CoreData


extension UserMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserMO> {
        return NSFetchRequest<UserMO>(entityName: "User")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var joke: NSSet?

}

// MARK: Generated accessors for joke
extension UserMO {

    @objc(addJokeObject:)
    @NSManaged public func addToJoke(_ value: JokeMO)

    @objc(removeJokeObject:)
    @NSManaged public func removeFromJoke(_ value: JokeMO)

    @objc(addJoke:)
    @NSManaged public func addToJoke(_ values: NSSet)

    @objc(removeJoke:)
    @NSManaged public func removeFromJoke(_ values: NSSet)

}

extension UserMO : Identifiable {

}

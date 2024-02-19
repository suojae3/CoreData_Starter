//
//  JokeMO+CoreDataProperties.swift
//  CoreData_Starter
//
//  Created by ㅣ on 2/19/24.
//
//

import Foundation
import CoreData


extension JokeMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JokeMO> {
        return NSFetchRequest<JokeMO>(entityName: "Joke")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var content: String?
    @NSManaged public var category: Int16
    @NSManaged public var user: UserMO?
    
}

extension JokeMO : Identifiable {
    
}

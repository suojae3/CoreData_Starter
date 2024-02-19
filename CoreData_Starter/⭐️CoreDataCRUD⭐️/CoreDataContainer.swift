

import Foundation
import CoreData

final class CoreDataContainer {
    
    static let shared = CoreDataContainer()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data Saving support
    
    func saveContext() {
        if context.hasChanges {
            guard let _ = try? context.save()
            else { fatalError(" error ") }
        }
    }
}

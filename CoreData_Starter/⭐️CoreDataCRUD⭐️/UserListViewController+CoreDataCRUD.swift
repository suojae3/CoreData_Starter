//
//  UserListViewController+CoreDataCRUD.swift
//  CoreData_Starter
//

import Foundation
import CoreData

//MARK: - ⭐️ CoreData CURD 구현하기 ⭐️
extension UserListViewController: CoreDataManagable {
    func saveCoreData(_ data: User) {
        let context = CoreDataContainer.shared.context // Use the context shorthand provided by the singleton
        
        let userMO = UserMO(context: context)
        userMO.id = data.id
        userMO.name = data.name
        
        CoreDataContainer.shared.saveContext()
    }
    
    func fetchCoreData() -> [User] {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData의 모든 User data를 가져오세요.
        
        let context = CoreDataContainer.shared.context
        let fetchRequest: NSFetchRequest<UserMO> = UserMO.fetchRequest()
        var users = [User]()
        
        guard let userMOs = try? context.fetch(fetchRequest) else { return [] }
        
        for userMO in userMOs {
            if let id = userMO.id, let name = userMO.name {
                let user = User(id: id, name: name, jokes: [])
                users.append(user)
            }
        }
        return users
    
        //        return userMO.compactMap { userMO in
        //            guard let id = userMO.id, let name = userMO.name else { return nil }
        //            return User(id: id, name: name, jokes: [])
        //        }
    }
    
    func updateCoreData(_ data: User) {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData의 특정 User data를 업데이트하세요.
        
        let context = CoreDataContainer.shared.context
        let fetchRequest: NSFetchRequest<UserMO> = UserMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", data.id as CVarArg)
        
        
        guard let results = try? context.fetch(fetchRequest) else { return }
        if let userMO = results.first {
            userMO.name = data.name
            CoreDataContainer.shared.saveContext()
        }
        // ---------------------------------------------------------------------------------------------------------//
        
    }
    fewefwef
    func deleteCoreData(_ data: User) {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData의 특정 User data를 삭제하세요.
        let context = CoreDataContainer.shared.context
        let fetchRequest: NSFetchRequest<UserMO> = UserMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", data.id as CVarArg)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let userMO = results.first {
                context.delete(userMO)
                CoreDataContainer.shared.saveContext()
            }
        } catch {
            print("Failed to delete user: \(error)")
        }
        
        // ---------------------------------------------------------------------------------------------------------//
        
    }
}

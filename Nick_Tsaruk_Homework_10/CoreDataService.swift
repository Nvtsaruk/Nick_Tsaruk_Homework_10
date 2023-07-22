//
//  CoreDataService.swift
//  CoreDataRighr
//
//  Created by Tsaruk Nick on 6.07.23.
//

import CoreData

final class CoreDataService {
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Nick_Tsaruk_Homework_10")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error),  \(error.userInfo)")
            }
        })
        return container
    }()
    
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(error),  \(nserror.userInfo)")
            }
        }
    }
    static func removeItemFromContext() {
        let context = persistentContainer.viewContext
//        context.delete(<#T##object: NSManagedObject##NSManagedObject#>)
    }
}

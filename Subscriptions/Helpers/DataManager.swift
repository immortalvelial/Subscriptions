//
//  DataManager.swift
//  Subscriptions
//
//  Created by Nikita on 03.04.22.
//

import CoreData

class DataManager {
    
    static let shared = DataManager()
    
    private var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Subscriptions")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    private var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {}
    
    func saveContext() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let error = error as NSError
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

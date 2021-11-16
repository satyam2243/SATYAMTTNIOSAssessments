//
//  CoreDataManager.swift
//  iOSAssessment-23
//
//  Created by satyam dixit on 12/11/21.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    static let sharedManager = CoreDataManager()
    private init() {} // Prevent clients from creating another instance.
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "iOSAssessment_23")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    
    
    
    
    func saveContext () {
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
 
    
    
    func insertRecipe(name: String?, ingredients : String?, date : Date?, createdBy : String?, timeToPrepare : Float)->Recipe? {
        
        let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
        
        let recipe = Recipe(context: managedContext)
        
        recipe.setValue(name, forKeyPath: "name")
        recipe.setValue(ingredients, forKeyPath: "ingredients")
        recipe.setValue(date, forKeyPath: "date")
        recipe.setValue(createdBy, forKeyPath: "createdBy")
        recipe.setValue(timeToPrepare, forKeyPath: "timeToPrepare")
        
        
        do {
            try managedContext.save()
            return recipe as? Recipe
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    
    
    
    
    
    
    func update(name: String?, ingredients : String?, date : Date?, createdBy : String?, timeToPrepare : Float, recipe : Recipe) {
        
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        
        do {
            
            recipe.setValue(name, forKeyPath: "name")
            recipe.setValue(ingredients, forKeyPath: "ingredients")
            recipe.setValue(date, forKeyPath: "date")
            recipe.setValue(createdBy, forKeyPath: "createdBy")
            recipe.setValue(timeToPrepare, forKeyPath: "timeToPrepare")
            
            print("\(recipe.value(forKey: "name") ?? "")")
            print("\(recipe.value(forKey: "createdBy") ?? "")")
            
            
            do {
                try context.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
            
        } catch {
            print("Error with request: \(error)")
        }

    }
    
    
    
    /*delete*/
    func delete(recipe : Recipe){
      
      let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
      
      do {
        
        managedContext.delete(recipe)
        
      } catch {
        // Do something in response to error condition
        print(error)
      }
      
      do {
        try managedContext.save()
      } catch {
        // Do something in response to error condition
      }
    }
    
    
    
    func fetchAllRecipies() -> [Recipe]?{
      
      let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext

      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
      
      do {
        let recipe = try managedContext.fetch(fetchRequest)
        return recipe as? [Recipe]
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
        return nil
      }
    }
    
    
    
}

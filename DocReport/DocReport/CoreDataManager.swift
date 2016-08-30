//
//  CoreDataManager.swift
//  DocReport
//
//  Created by Albin on 30/08/16.
//  Copyright © 2016 Albin. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager{
    // MARK :- managedObjectContext -
    func managedObjectContext() -> NSManagedObjectContext{
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext
        
    }
    
    func saveData() {
        let moc: NSManagedObjectContext = managedObjectContext()
        
        do {
            try moc.save()
        } catch {
            print("Could not save")
        }
    }
    
    func fetchObjectsFromEntity(entityName: String, predicate: NSPredicate?, sortDes: NSSortDescriptor?) -> [AnyObject] {
        
        let moc: NSManagedObjectContext = managedObjectContext()
        let entityDescription: NSEntityDescription = NSEntityDescription.entityForName(entityName, inManagedObjectContext: moc)!
        let request: NSFetchRequest = NSFetchRequest()
        request.entity = entityDescription
        
        if predicate != nil {
            request.predicate = predicate
        }
        if sortDes != nil{
            request.sortDescriptors = [sortDes!]
        }
        let array: [AnyObject] = try! moc.executeFetchRequest(request)
        return array
    }
    
    
    
    func createList(listModelObject: [String:AnyObject]) -> List {
        
        let moc: NSManagedObjectContext = managedObjectContext()
        
        let listObject: List = (NSEntityDescription.insertNewObjectForEntityForName("List", inManagedObjectContext: moc) as! List)
        
        createtListFromDetails(listObject,listModelObject: listModelObject)
        saveData()
        
        return listObject
    }
    
    
    func getAllList() -> [List]? {
        
        let businesses: [AnyObject] = fetchObjectsFromEntity("List", predicate: nil, sortDes: nil)
        
        if businesses.count <= 0 {
            print("Fatal: error")
            return nil
        }
        
        return businesses as? [List]
    }
    
    
    
    
    
    func createtListFromDetails(listObject: List,listModelObject: [String:AnyObject]) -> Void {
        
        listObject.name = listModelObject["name"] as? String
        listObject.age = listModelObject["age"] as? NSNumber
        listObject.diabetic = listModelObject["diabetic"] as? Bool
        listObject.breathingissue = listModelObject["breathingissue"] as? Bool
        listObject.sex = listModelObject["sex"] as? Bool
 
    }
    
    
    
    
    
}
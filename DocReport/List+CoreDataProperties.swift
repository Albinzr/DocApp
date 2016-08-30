//
//  List+CoreDataProperties.swift
//  DocReport
//
//  Created by Albin on 30/08/16.
//  Copyright © 2016 Albin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension List {

    @NSManaged var name: String?
    @NSManaged var age: NSNumber?
    @NSManaged var sex: NSNumber?
    @NSManaged var diabetic: NSNumber?
    @NSManaged var breathingissue: NSNumber?

}

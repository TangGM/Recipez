//
//  Recipe+CoreDataProperties.swift
//  recipez
//
//  Created by Tang on 2016/5/22.
//  Copyright © 2016年 Tang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Recipe {

    @NSManaged var ingredients: String?
    @NSManaged var steps: String?
    @NSManaged var title: String?
    @NSManaged var images: NSData?

}

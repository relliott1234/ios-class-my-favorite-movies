//
//  Movie+CoreDataProperties.swift
//  my-favorite-movies
//
//  Created by Ray Elliott on 1/28/16.
//  Copyright © 2016 Crossway. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var plot: String?
    @NSManaged var imdbLink: String?
    @NSManaged var myDesc: String?
    @NSManaged var title: String?
    @NSManaged var image: NSData?

}

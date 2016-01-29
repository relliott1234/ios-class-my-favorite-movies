//
//  Movie.swift
//  my-favorite-movies
//
//  Created by Ray Elliott on 1/28/16.
//  Copyright © 2016 Crossway. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movie: NSManagedObject {

    func getMovieImage() -> UIImage {
        if let img = UIImage(data: self.image!) {
            return img
        }
        return UIImage()
    }
    
    func setMovieImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }

}

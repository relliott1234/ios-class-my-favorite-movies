//
//  AddMovieVC.swift
//  my-favorite-movies
//
//  Created by Ray Elliott on 1/28/16.
//  Copyright © 2016 Crossway. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var imdbUrlField: UITextField!
    @IBOutlet weak var imdbPlotDescField: UITextField!
    @IBOutlet weak var movieImg: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        movieImg.layer.cornerRadius = 6.0
        movieImg.clipsToBounds = true
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
    }
    
    @IBAction func addMovieImageButtonPressed(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func addMovieBtnPressed(sender: AnyObject) {
        if let title = titleField.text where title != "", let description = descField.text where description != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            if let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context) {
                let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
                movie.title = titleField.text
                movie.myDesc = descField.text
                movie.imdbLink = imdbUrlField.text
                movie.plot = imdbPlotDescField.text
                if let movieImage = movieImg.image {
                    movie.setMovieImage(movieImage)
                }
                context.insertObject(movie)
                
                do {
                    try context.save()
                } catch {
                    print("Could not save movie info")
                }
                self.navigationController?.popViewControllerAnimated(true)
            }
        }
    }

}

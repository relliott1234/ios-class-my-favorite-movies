//
//  ViewController.swift
//  my-favorite-movies
//
//  Created by Ray Elliott on 1/28/16.
//  Copyright © 2016 Crossway. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        getResults()
        tableView.reloadData()
    }

    func getResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movie]
        } catch let err as NSError {
            print("Fetching movies failed with error \(err)")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            let indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow!
            let detailsVC: DetailsVC = segue.destinationViewController as! DetailsVC
            detailsVC.movie = movies[indexPath.row] as Movie
            let backItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backItem
       } else if segue.identifier == "addMovie" {
            let backItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backItem
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}


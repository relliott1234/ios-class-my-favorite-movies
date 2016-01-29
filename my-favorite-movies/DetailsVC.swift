//
//  DetailsVC.swift
//  my-favorite-movies
//
//  Created by Ray Elliott on 1/28/16.
//  Copyright © 2016 Crossway. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var plotSummaryLbl: UILabel!
    @IBOutlet weak var imdbLinkBtn: UIButton!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var backgroundImg: UIImageView!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = self.movie {
            titleLbl.text = movie.title
            imdbLinkBtn.setTitle(movie.imdbLink, forState: UIControlState.Normal)
            descLbl.text = movie.myDesc
            plotSummaryLbl.text = movie.plot
            movieImg.image = movie.getMovieImage()
            movieImg.layer.cornerRadius = 7.0
            movieImg.clipsToBounds = true
            backgroundImg.image = movieImg.image
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     
    @IBAction func linkBtnPressed(sender: AnyObject) {
        if let url = NSURL(string: imdbLinkBtn.titleForState(UIControlState.Normal)!) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
}

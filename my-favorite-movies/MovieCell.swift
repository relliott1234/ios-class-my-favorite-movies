//
//  MovieCell.swift
//  my-favorite-movies
//
//  Created by Ray Elliott on 1/28/16.
//  Copyright © 2016 Crossway. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var myDesc: UILabel!
    @IBOutlet weak var imdbLink: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img.layer.cornerRadius = 6.0
        img.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(movie: Movie) {
        title.text = movie.title
        myDesc.text = movie.myDesc
        imdbLink.text = movie.imdbLink
        img.image = movie.getMovieImage()
    }

}

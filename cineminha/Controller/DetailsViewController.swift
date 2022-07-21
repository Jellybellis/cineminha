//
//  DetailsViewController.swift
//  cineminha
//
//  Created by Isabela Batista on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
   
    var movie: Movie?
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var overviewView: UIView!
    @IBOutlet var ratingView: UIView!
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
        backdropImage.layer.borderWidth = 1
        backdropImage.layer.borderColor = UIColor.lightGray.cgColor
        backdropImage.layer.cornerRadius = 12
        
        posterImage.layer.borderWidth = 1
        posterImage.layer.borderColor = UIColor.lightGray.cgColor
        posterImage.layer.cornerRadius = 6
        
        overviewView.layer.cornerRadius = 15
        ratingView.layer.cornerRadius = 15
        
        
        
        guard let movie = movie else {
            return
        }
        
        title = movie.title
        backdropImage.image = UIImage(named: movie.backdropPath)
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.posterPath)
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
        
        Task{
            let backdropURL = await Movie.downloadImageData(withPath: movie.backdropPath)
            let backdrop = UIImage(data: backdropURL) ?? UIImage()
            self.backdropImage.image = backdrop
            
            let posterURL = await Movie.downloadImageData(withPath: movie.posterPath)
            let poster = UIImage(data: posterURL) ?? UIImage()
            self.posterImage.image = poster
            
        }
    }
    
    
    
    

}

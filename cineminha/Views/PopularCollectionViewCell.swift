//
//  PopularCollectionViewCell.swift
//  cineminha
//
//  Created by Isabela Batista on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let cellidentifier = "popularCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    func setup (title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image
    }
}  //Now playing tem date label, image e title

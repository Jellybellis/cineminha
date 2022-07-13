//
//  NowplayingCollectionViewCell.swift
//  cineminha
//
//  Created by Isabela Batista on 11/07/22.
//

import UIKit

class NowplayingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "nowPlayingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
}

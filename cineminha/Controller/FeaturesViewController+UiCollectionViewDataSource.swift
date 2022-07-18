//
//  FeaturesViewController+UiCollectionViewDataSource.swift
//  cineminha
//
//  Created by Isabela Batista on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.popularCollectionView {
            return popularMovies.count
        } else if collectionView == self.nowPlayingCollectionView {
            return nowPlayingMovies.count
        } else {
            return 0
        }
        
        
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellidentifier, for: indexPath) as? PopularCollectionViewCell
        
        cell?.titleLabel.text = popularMovies[indexPath.item].title
        cell?.imageView.image = UIImage(named: popularMovies[indexPath.item].backdropPath)
        
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowplayingCollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowplayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowplayingCollectionViewCell
        
        cell?.titleLabel.text = nowPlayingMovies [indexPath.item].title
        let year: String = String(nowPlayingMovies [indexPath.item].releaseDate.prefix(4))
        cell?.dateLabel.text = year
        cell?.imageView.image = UIImage(named: nowPlayingMovies [indexPath.item].posterPath)
        
        return cell ?? NowplayingCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.popularCollectionView {
            return makePopularCell(indexPath)
            
        } else if collectionView == self.nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        } else {
            return UICollectionViewCell()
        }
    }
}

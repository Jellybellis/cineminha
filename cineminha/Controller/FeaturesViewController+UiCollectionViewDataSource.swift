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
        } else if collectionView == self.upComingCollectionView {
            return upcomingMovies.count }
        else {
            return 0
        }
        
        
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellidentifier, for: indexPath) as? PopularCollectionViewCell
        
        let movie = popularMovies[indexPath.item]
        cell?.setup(title:movie.title, image: UIImage())
        
        Task{
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let image: UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title:movie.title, image: image)
        }
        
        
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowplayingCollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowplayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowplayingCollectionViewCell
        
        let movie = nowPlayingMovies[indexPath.item]
        let year: String = String(movie.releaseDate.prefix(4))
       
        cell?.setup(title: movie.title, year: year, image: UIImage())
        
        Task{
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let image: UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, year: year, image: image)
        }
        
        return cell ?? NowplayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let cell = upComingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        let movie = upcomingMovies[indexPath.item]
        let year: String = String(movie.releaseDate.prefix(4))
       
        cell?.setup(title: movie.title, year: year, image: UIImage())
        
        Task{
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let image: UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, year: year, image: image)
        }
        
        return cell ?? UpcomingCollectionViewCell()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.popularCollectionView {
            return makePopularCell(indexPath)
            
        } else if collectionView == self.nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        } else if collectionView == self.upComingCollectionView {
            return makeUpcomingCell(indexPath)
            }else {
            return UICollectionViewCell()
        }
    }
}

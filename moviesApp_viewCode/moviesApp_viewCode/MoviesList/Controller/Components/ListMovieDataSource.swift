//
//  ListCardDataSource.swift
//  magic-bootcamp
//
//  Created by mateus.santos on 16/03/21.
//

import UIKit
import Kingfisher 
 
class ListMovieDataSource: NSObject, UICollectionViewDataSource {
    
    weak var delegateCell: delegateMovieCollectionViewCell?
    
    var movieModel: MovieView?
    
    init(delegate: delegateMovieCollectionViewCell?) {
        self.delegateCell = delegate
    }
    
    func updateData(movieModel: MovieView) {
        self.movieModel = movieModel
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return movieModel?.sections ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieModel?.qtdMovies ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifierListCell, for: indexPath) as? MovieCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.delegate = delegateCell
        cell.setUpCell(
            index: movieModel?.listMovie[indexPath.row].index ?? 0,
            isFavorite:movieModel?.listMovie[indexPath.row].isFavorite ?? false,
            titleMovie: movieModel?.listMovie[indexPath.row].title ?? "Error",
            movieImage: movieModel?.listMovie[indexPath.row].imageMovie ?? UIImage()
        )
        
        return cell
    }
    
}

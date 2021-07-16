//
//  FavoritesPresenter.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 16/07/21.
//

import Foundation

class FavoritesPresenter: FavoritesPresenterInputProtocol {
    
    var view: FavoritesViewProtocol?
    
    var repository: MovieRepositoryInputProtocol
    
    init(repository: MovieRepositoryInputProtocol = MovieRepository.share) {
        self.repository = repository
        repository.output = self
    }
    
    init(_ view: FavoritesViewProtocol, repository: MovieRepositoryInputProtocol) {
        self.view = view
        self.repository = repository
        repository.output = self
    }
    
    func fetchMovies() {
        repository.fetchMoviesPersistence()
    }
    
    func desFavorite(_ movie: MovieParse) {
        repository.disfavor(movie.id)
    }
   
}

extension FavoritesPresenter: MovieRepositoryOutputProtocol {
    
    func fetchMoviesResponse(_ movieData: [MovieParse]) {
        var newList: [MovieParse] = []
        movieData.forEach{
            let movieParse = MovieParse(
                id: $0.id,
                title: $0.title,
                overview: $0.overview,
                poster_path: $0.poster_path
            )
            movieParse.imageMovie = repository.getImage(imagePath: $0.poster_path)
            movieParse.isFavorite = repository.checkIfIsFavorite($0.id)
            newList.append(movieParse)
        }
        let movieData = MovieView(sections: 1, qtdMovies: movieData.count, listMovie: newList)
        
        view?.fetchMoviesResponse(movieData)
    }
    
}

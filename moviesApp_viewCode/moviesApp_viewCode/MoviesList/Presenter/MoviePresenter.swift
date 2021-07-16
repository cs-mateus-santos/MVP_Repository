//
//  MovieViewModel.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 06/05/21.
//

class MoviePresenter: MoviePresenterInputProtocol {
    
    var view: MovieViewProtocol?
    
    var repository: MovieRepositoryInputProtocol
    
    init(_ view: MovieViewProtocol) {
        self.view = view
        self.repository = MovieRepository()
        repository.output = self
    }
    
    func fetchMovies() {
        repository.fetchMoviesAPI()
    }
    
    func favorite(_ movie: MovieParse) {
        repository.favoriteMovie(movie)
    }
   
}

extension MoviePresenter: MovieRepositoryOutputProtocol {
    
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

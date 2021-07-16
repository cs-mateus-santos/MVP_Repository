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
    
    func favorite(_ index: Int) {
        repository.favoriteMovie(index)
    }
   
}

extension MoviePresenter: MovieRepositoryOutputProtocol {
    
    func fetchMoviesResponse(_ movieData: [MovieParse]) {
        var count = 0
        var newList = movieData
        movieData.forEach{
            let movieParse = MovieParse(
                isFavorite: repository.checkIfIsFavorite(count),
                index: count,
                id: $0.id,
                title: $0.title,
                imageMovie: repository.getImage(imagePath: $0.poster_path)
            )
            newList.append(movieParse)
            count += 1
        }
        
        let movieData = MovieView(sections: 1, qtdMovies: movieData.count, listMovie: newList)
        
        view?.fetchMoviesResponse(movieData)
    }
    
}

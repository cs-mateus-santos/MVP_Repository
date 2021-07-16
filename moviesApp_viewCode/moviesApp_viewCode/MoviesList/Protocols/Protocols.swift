//
//  Protocols.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 15/07/21.
//

import UIKit


internal protocol MoviePresenterInputProtocol: AnyObject {

    var view: MovieViewProtocol? { get set }
    var repository: MovieRepositoryInputProtocol { get set }

    func fetchMovies()
    func favorite(_ movie: MovieParse)
}

internal protocol MovieViewProtocol: AnyObject {

    func fetchMoviesResponse(_ movieData: MovieView)

}

internal protocol MovieRepositoryInputProtocol: AnyObject {

    var output: MovieRepositoryOutputProtocol? { get set }

    func fetchMoviesAPI()
    func fetchMoviesPersistence()
    func favoriteMovie(_ movie: MovieParse)
    func checkIfIsFavorite(_ index: Int) -> Bool
    func getImage(imagePath: String) -> UIImage
    
}

internal protocol MovieRepositoryOutputProtocol: AnyObject {

    func fetchMoviesResponse(_ movieData: [MovieParse])

}

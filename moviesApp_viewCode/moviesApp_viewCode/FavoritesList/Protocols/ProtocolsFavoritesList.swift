//
//  ProtocolsFavoritesList.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 16/07/21.
//

import UIKit

internal protocol FavoritesPresenterInputProtocol: AnyObject {

    var view: FavoritesViewProtocol? { get set }
    var repository: MovieRepositoryInputProtocol { get set }

    func fetchMovies()
    func favorite(_ movie: MovieParse)
}

internal protocol FavoritesViewProtocol: AnyObject {

    func fetchMoviesResponse(_ movieData: MovieView)

}


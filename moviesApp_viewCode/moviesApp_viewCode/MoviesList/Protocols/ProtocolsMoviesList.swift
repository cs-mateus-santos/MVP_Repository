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

//
//  ProtocolsRepository.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 16/07/21.
//

import UIKit


internal protocol MovieRepositoryInputProtocol: AnyObject {

    var output: MovieRepositoryOutputProtocol? { get set }

    func fetchMoviesAPI()
    func fetchMoviesPersistence()
    func favoriteMovie(_ movie: MovieParse)
    func disfavor(_ id: Int)
    func checkIfIsFavorite(_ index: Int) -> Bool
    func getImage(imagePath: String) -> UIImage
    
}

internal protocol MovieRepositoryOutputProtocol: AnyObject {

    func fetchMoviesResponse(_ movieData: [MovieParse])

}

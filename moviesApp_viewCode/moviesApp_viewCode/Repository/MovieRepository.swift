//
//  MovieRepository.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 15/07/21.
//

import UIKit

protocol PersistenceRepository {
    var movies: [MovieObject] { get set }
    
    func save(_ object:MovieParse) -> Bool
    func checkIfIsFavorite(_ id:Int) -> Bool
    func fetch() -> [MovieParse]
    func update(_ id:Int, newObject: MovieParse)
    func delete(_ id:Int)
}

protocol ApiRepository {
    func fetch(completion: @escaping ([MovieParse]?) -> Void)
}

protocol URLImages {
    func getImage(imagePath: String, completion: @escaping (Data) -> Void)
}

class MovieRepository: MovieRepositoryInputProtocol {

    static let share = MovieRepository()
    
    var output: MovieRepositoryOutputProtocol?
    
    let api: ApiRepository
    let persistence: PersistenceRepository
    let images: URLImages
    
    
    init(
        api: ApiRepository = APIClientMovieDB(),
        persistence: PersistenceRepository = CRUDRealm.share,
        images: URLImages = ImageURLSwift()) {
        self.api = api
        self.persistence = persistence
        self.images = images
    }
    
    func fetchMoviesAPI() {
        api.fetch{ [weak self] listaMovies in
            if let lista = listaMovies {
                self?.output?.fetchMoviesResponse(lista)
            } else {
                print("not found")
            }
        }
    }
    
    func fetchMoviesPersistence() {
        let list = persistence.fetch()
        self.output?.fetchMoviesResponse(list)
    }
    
    func favoriteMovie(_ movie: MovieParse) {
        _ = persistence.save(movie)
    }
    
    func disfavor(_ id: Int) {
        persistence.delete(id)
    }
    
    func checkIfIsFavorite(_ index: Int) -> Bool {
        return persistence.checkIfIsFavorite(index)
    }
    
    func getImage(imagePath: String) -> UIImage {
        var dataImage = UIImage()
        images.getImage(imagePath: imagePath) { data in
            dataImage = UIImage(data: data) ?? UIImage()
        }
        return dataImage
    }
    
}

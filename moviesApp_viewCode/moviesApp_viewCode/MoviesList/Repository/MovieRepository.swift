//
//  MovieRepository.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 15/07/21.
//

import UIKit

protocol PersistenceRepository {
    var movies: [MovieObject]? { get set }
    
    func save(_ object:MovieObject) -> Bool
    func checkIfIsFavorite(_ index:Int) -> Bool
    func favorite(_ index:Int)
    func fetch()
    func update(_ index:Int,_ newObject: MovieObject)
    func delete(_ index:Int)
}

protocol ApiRepository {
    func fetch(completion: @escaping ([MovieParse]?) -> Void)
}

protocol URLImages {
    func getImage(imagePath: String, completion: @escaping (Data) -> Void)
}

class MovieRepository: MovieRepositoryInputProtocol {
    
    var output: MovieRepositoryOutputProtocol?
    
    let api: ApiRepository
    let persistence: PersistenceRepository
    let images: URLImages
    
    
    init(
        api: ApiRepository = APIClientMovieDB(),
        persistence: PersistenceRepository = CRUDRealm(),
        images: URLImages = ImageURLKingFisher()) {
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
        persistence.fetch()
        let list = persistence.movies
        var listReturn:[MovieParse] = []
        list?.forEach{
            //Parse 1
            let movieParse = MovieParse(
                isFavorite: $0.isFavorite,
                index: nil,
                id: $0.id,
                title: $0.title,
                overview: $0.overview,
                imageMovie: nil
            )
            listReturn.append(movieParse)
            
            self.output?.fetchMoviesResponse(listReturn)
        
        }
    }
    
    func favoriteMovie(_ index: Int) {
        persistence.favorite(index)
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

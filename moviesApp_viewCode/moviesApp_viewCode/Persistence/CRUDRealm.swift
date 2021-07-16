//
//  CRUD.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 06/05/21.
//

import RealmSwift

public class CRUDRealm: PersistenceRepository {

    public var movies: [MovieObject] = []
    
    public init() {

    }
    
    static var share: CRUDRealm = CRUDRealm()
    
    internal func save(_ object: MovieParse) -> Bool {
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        do {
            try PersistenceRealm.realm?.write{
                let movie = MovieObject()
                movie.id = object.id
                movie.overview = object.overview
                movie.poster_path = object.poster_path
                movie.release_date = object.poster_path
                movie.title = object.title
                PersistenceRealm.realm?.add(movie)
            }
            return true
        } catch {
            print("Error in save method")
            return false
        }
    }
    
    public func checkIfIsFavorite(_ id:Int) -> Bool{
        updateList()
        
        for object in movies {
            if object.id == id {
                return true
            }
        }
        return false
    }
    
    internal func favorite(_ movie: MovieParse) {
        if save(movie) {
            NSLog("Favoritado com Sucesso !!!")
        } else {
            NSLog("Erro em favoritar !!!")
        }
    }
    
    func updateList() {
        guard let list = PersistenceRealm.realm?.objects(MovieObject.self) else { return }
        movies = Array(list)
        
    }
    
    internal func fetch() -> [MovieParse] {
        updateList()
        var listReturn:[MovieParse] = []
        movies.forEach{
            //Parse 1
            let movieParse = MovieParse(
                id: $0.id,
                title: $0.title,
                overview: $0.overview,
                poster_path: $0.poster_path
            )
            listReturn.append(movieParse)
        }
        return listReturn
    }
    
    public func fetchAllIds() -> [Int] {
        updateList()
        var ids:[Int] = []
        movies.forEach { movie in
            ids.append(movie.id)
        }
        return ids
    }
    
    public func fetchAllTitles() -> [String] {
        updateList()
        var titles:[String] = []
        movies.forEach { movie in
            titles.append(movie.title)
        }
        return titles
    }
    
    public func fetchAllOverview() -> [String] {
        updateList()
        var overviews:[String] = []
        movies.forEach { movie in
            overviews.append(movie.overview)
        }
        return overviews
    }
    
    public func fetchAllPoster_path() -> [String] {
        updateList()
        var posters:[String] = []
        movies.forEach { movie in
            posters.append(movie.poster_path)
        }
        return posters
    }
    
    public func fetchAllRelease_date() -> [String] {
        updateList()
        var dates:[String] = []
        movies.forEach { movie in
            dates.append(movie.release_date)
        }
        return dates
    }
    
    internal func update(_ index:Int, newObject: MovieParse) {
        let movie = movies[index]
        do {
            try PersistenceRealm.realm?.write{
                movie.id = newObject.id
                movie.overview = newObject.overview
                movie.poster_path = newObject.poster_path
                movie.release_date = newObject.poster_path
                movie.title = newObject.title
                PersistenceRealm.realm?.add(movie)
            }
        } catch {
            print("Error in update method")
        }
    }
    
    public func delete(_ index:Int) {
        let movie = movies[index]
        do {
            let realm  = try Realm()
            try realm.write{
                realm.delete(movie)
            }
        } catch {
            print("Error in update method")
        }
    }
}

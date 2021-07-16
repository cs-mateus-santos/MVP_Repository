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
    
    public func delete(_ id:Int) {
        updateList()
        for object in movies {
            if object.id == id {
                do {
                    try PersistenceRealm.realm?.write{
                        PersistenceRealm.realm?.delete(object)
                    }
                } catch {
                    print("Error in update method")
                }
            }
        }
    }
}

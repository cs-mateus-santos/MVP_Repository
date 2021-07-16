//
//  CRUD.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 06/05/21.
//

import RealmSwift

public class CRUDRealm: PersistenceRepository {
    
    lazy var realm: Realm = {
        do {
            let object = try Realm()
            return object
        } catch  {
            fatalError()
        }
    }()
    
    public var movies: [MovieObject]?

    public init(){

    }
    
    public func save(_ object:MovieObject) -> Bool{
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        do {
            try realm.write{
                realm.add(object)
            }
            return true
        } catch {
            print("Error in save method")
            return false
        }
    }
    
    public func checkIfIsFavorite(_ index:Int) -> Bool{
        guard let movie = movies?[index] else { return false }
        if movie.isFavorite {
            return true
        }else{
            return false
        }
    }
    
    public func favorite(_ index:Int) {
        if let movie = movies?[index] {
            do {
                try realm.write{
                    movie.isFavorite = true
                }
            } catch {
                print("Error in update method")
            }
        }
    }
    
    public func fetch() {
        movies = Array(realm.objects(MovieObject.self))
    }
    
    public func fetchAllIds() -> [Int] {
        movies = Array(realm.objects(MovieObject.self))
        var ids:[Int] = []
        movies?.forEach { movie in
            ids.append(movie.id)
        }
        return ids
    }
    
    public func fetchAllTitles() -> [String] {
        movies = Array(realm.objects(MovieObject.self))
        var titles:[String] = []
        movies?.forEach { movie in
            titles.append(movie.title)
        }
        return titles
    }
    
    public func fetchAllOverview() -> [String] {
        movies = Array(realm.objects(MovieObject.self))
        var overviews:[String] = []
        movies?.forEach { movie in
            overviews.append(movie.overview)
        }
        return overviews
    }
    
    public func fetchAllPoster_path() -> [String] {
        movies = Array(realm.objects(MovieObject.self))
        var posters:[String] = []
        movies?.forEach { movie in
            posters.append(movie.poster_path)
        }
        return posters
    }
    
    public func fetchAllRelease_date() -> [String] {
        movies = Array(realm.objects(MovieObject.self))
        var dates:[String] = []
        movies?.forEach { movie in
            dates.append(movie.release_date)
        }
        return dates
    }
    
    public func update(_ index:Int,_ newObject: MovieObject) {
        if let movie = movies?[index]{
            do {
                try realm.write{
                    movie.title = newObject.title
                    movie.overview = newObject.overview
                    movie.poster_path = newObject.poster_path
                }
            } catch {
                print("Error in update method")
            }
        }
    }
    
    public func delete(_ index:Int) {
        if let movie = movies?[index]{
            do {
                try realm.write{
                    realm.delete(movie)
                }
            } catch {
                print("Error in update method")
            }
        }
    }
}

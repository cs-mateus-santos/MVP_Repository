//
//  APIClient.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 06/05/21.
//

import Alamofire

class APIClientMovieDB: ApiRepository {
    
    private var baseURL:String = "https://api.themoviedb.org/3/"
    private var path:String = "movie/popular"
    private var apiKey:String = "api_key=2852a7a7b179338b2b037c9b555a69da"

    var request:APIRequestMovieDB?
    
    init() {
        request = APIRequestMovieDB()
    }
    
    func fetch(completion: @escaping ([MovieParse]?) -> Void) {
        fetchTheMovieDb(1, .get) { items in
            if let list = items {
                var listReturn:[MovieParse] = []
                list.forEach{
                    let movieParse = MovieParse(
                        isFavorite: false,
                        index: nil,
                        id: $0.id ?? 0,
                        title: $0.title ?? "ERROR",
                        poster_path: $0.poster_path ?? "ERROR",
                        imageMovie: nil
                    )
                    listReturn.append(movieParse)
                }
                completion(listReturn)
            } else {
                print("not found")
            }
        }
    }
    
    func fetchTheMovieDb(_ page:Int,_ method:HTTPMethod, completion: @escaping ([Movie]?) -> Void){
        let url = "\(baseURL)\(path)?\(apiKey)&page=\(page)"
        
        request?.request(url, .get, completion: { listMovie,error  in
            if error == nil {
                completion(listMovie ?? [])
            }
        })
    }
}

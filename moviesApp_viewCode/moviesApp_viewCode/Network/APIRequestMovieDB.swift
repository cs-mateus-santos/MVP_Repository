//
//  APIRequest.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 06/05/21.
//

import Alamofire

protocol ObserverRequest {
    func notifyAll()
}

class APIRequestMovieDB {
    var allObserver:[ObserverRequest] = []

    func request(
        _ url:String,
        _ method:HTTPMethod,
        completion: @escaping ([Movie]?,Error?) -> Void) {
        
        guard let url = URL(string: url) else{ return}
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method

        AF.request(url).response { [weak self] response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let list = try decoder.decode(List.self, from: data)
                completion(list.results,nil)
                self?.notifyAll()
            } catch let error {
                print(error)
                completion(nil,error)
            }
        }
    }
}

extension APIRequestMovieDB:ObserverRequest{
    func notifyAll() {
        allObserver.forEach { observer in
            observer.notifyAll()
        }
    }
}

//
//  ImageURLSwift.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 16/07/21.
//

import Foundation

class ImageURLSwift: URLImages {
    
    func getImage(imagePath: String, completion: @escaping (Data) -> Void) {
        let url = URL(string: "https://image.tmdb.org/t/p/w185/\(imagePath)") ?? URL(fileURLWithPath: "ERROR")
        if let data = try? Data(contentsOf: url) {
            completion(data)
        }
    }
    
}

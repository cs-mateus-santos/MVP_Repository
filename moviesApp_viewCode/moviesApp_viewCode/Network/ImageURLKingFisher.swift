//
//  ImageURLKingFisher.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 15/07/21.
//

import UIKit
import Kingfisher

class ImageURLKingFisher: URLImages {
    
    func getImage(imagePath: String, completion: @escaping (Data) -> Void) {
        let url = URL(string: "https://image.tmdb.org/t/p/w185/\(imagePath)") ?? URL(fileURLWithPath: "ERROR")
        
        ImageDownloader.default.downloadImage(with: url, options: [], progressBlock: nil) {
            result in
            switch result {
            case let .success(image):
                completion(image.originalData)
            case .failure(_): break
            }
        }
    }

}

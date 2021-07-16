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
        let resource = ImageResource(downloadURL: url, cacheKey: "")

        KingfisherManager.shared.retrieveImage(with: resource) { result in
            switch result {
            case let .success(imageResult):
                completion(imageResult.image.pngData() ?? Data())
            case .failure(_): break
            }
        }
    }

}

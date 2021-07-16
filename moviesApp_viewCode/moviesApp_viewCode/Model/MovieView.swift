//
//  MovieView.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 15/07/21.
//

import UIKit

struct MovieView {
    var sections: Int
    var qtdMovies: Int
    var listMovie: [MovieParse]
}

class MovieParse {
    var id: Int = 0
    var index: Int?
    var isFavorite: Bool = false
    var title: String = ""
    var overview: String = ""
    var poster_path: String = ""
    var imageMovie: UIImage?
    
    init() {
        
    }
    
    init(id: Int, title: String, overview: String, poster_path: String) {
        self.id = id
        self.title = title
        self.overview = overview
        self.poster_path = poster_path
    }
}

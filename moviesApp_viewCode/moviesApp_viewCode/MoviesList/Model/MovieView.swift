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

struct MovieParse {
    var isFavorite = false
    var index: Int?
    var id: Int = 0
    var title: String = ""
    var overview: String = ""
    var poster_path: String = ""
    var imageMovie: UIImage?
}

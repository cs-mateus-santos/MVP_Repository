//
//  Decodable.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 06/05/21.
//

import Foundation

struct List:Codable {
    var page:Int?
    var results:[Movie]?
    var total_pages:Int?
    var total_results:Int?
}

struct Movie:Codable {
    var adult:Bool?
    var backdrop_path:String?
    var genre_ids:[Int]?
    var id:Int?
    var original_language:String?
    var original_title:String?
    var overview:String?
    var popularity:Float?
    var poster_path:String?
    var release_date:String?
    var title:String?
    var video:Bool?
    var vote_average:Float?
    var vote_count:Int
}

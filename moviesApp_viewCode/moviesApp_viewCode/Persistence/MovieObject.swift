//
//  Movie.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 06/05/21.
//

import RealmSwift

public class MovieObject:Object {
    @objc public dynamic var id:Int = 0
    @objc public dynamic var isFavorite:Bool = false
    @objc public  dynamic var title:String = ""
    @objc public dynamic var overview:String = ""
    @objc public dynamic var poster_path:String = ""
    @objc public dynamic var release_date:String = ""
    
    func toDict() -> [String:Any]{
        var dict:[String:Any] = [:]
        dict["id"] = id
        dict["title"] = title
        dict["overview"] = overview
        dict["poster_path"] = poster_path
        dict["release_date"] = release_date

        return dict
    }
}


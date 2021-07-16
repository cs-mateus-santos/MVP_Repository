//
//  RealmObject.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 16/07/21.
//

import RealmSwift

class PersistenceRealm {
    static let realm:Realm? = {
        let _realm:Realm?
        do{
            _realm = try Realm()
            return _realm
        }catch{
            NSLog("Error in create a Realm instance")
        }
        return nil
    }()
    
}

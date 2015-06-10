//
//  User.swift
//  BaseProject
//
//  Created by Patricio López on 10-06-15.
//  Copyright (c) 2015 patriciolopez. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

class User : Object {
    dynamic var id: String = ""
    dynamic var name: String = ""
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
    
    override class func primaryKey() -> String {
        return "id"
    }
}

extension User : Mappable {
    
    func mapping(map: Map) {
        id         <- map["id"]
        name       <- map["name"]
    }
}
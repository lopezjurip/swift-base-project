//
//  Resource.swift
//  BaseProject
//
//  Created by Patricio López on 09-06-15.
//  Copyright (c) 2015 patriciolopez. All rights reserved.
//

import UIKit
import ObjectMapper
import Realm

class Resource : RLMObject {
    dynamic var id: String = ""
    dynamic var text: String = ""
    dynamic var user: User?
    dynamic var followers: [User]?
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
    
    override class func primaryKey() -> String {
        return "id"
    }
}

extension Resource : Mappable {
    
    func mapping(map: Map) {
        id              <- map["id"]
        text            <- map["text"]
        user            <- map["user"]
        followers       <- map["followers"]
    }
}

//
//  Resource.swift
//  BaseProject
//
//  Created by Patricio López on 09-06-15.
//  Copyright (c) 2015 patriciolopez. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

class Resource : Object {
    dynamic var id: String = ""
    dynamic var text: String = ""
    dynamic var user: User = User()
    dynamic var followers: [User] = [User]()
    // let followers2 = List<User>()
    
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
        
//        let transform = TransformOf<List<User>, String>(fromJSON: { (value: String?) -> List<User>? in
//            // transform value from String? to Int?
//            return value?.toInt()
//            }, toJSON: { (value: Int?) -> String? in
//                // transform value from Int? to String?
//                if let value = value {
//                    return String(value)
//                }
//                return nil
//        })
//        followers <- (map["followers"], transform)
        followers       <- map["followers"]
    }
}

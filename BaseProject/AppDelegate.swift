//
//  AppDelegate.swift
//  BaseProject
//
//  Created by Patricio López on 09-06-15.
//  Copyright (c) 2015 patriciolopez. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON
import RealmSwift
import Cent

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let json = JSON([
            "id": "1",
            "text": "hello world",
            "user":
            [
                "id": "2",
                "name": "Lorena Ipsum"
            ],
            "followers":
            [
                [
                    "id": "1",
                    "name": "John Appleseed"
                ],
                [
                    "id": "10",
                    "name": "Juanito Perez"
                ]
            ]
        ])
        
        let realm = Realm()
        
        realm.beginWrite()
        let resource : Resource? = Mapper<Resource>().map(json.dictionaryObject)
        if let validResource = resource {
            realm.add(validResource)
        }
        realm.commitWrite()

        for resource in realm.objects(Resource) {
            println("Text: " + resource.text)
            println("Owner's name: " + resource.user.name)
            println("Followers: ")
            
            for follower in resource.followers {
                println("\tName: " + follower.name)
            }
            
            println("-"*10)
            println(resource)
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


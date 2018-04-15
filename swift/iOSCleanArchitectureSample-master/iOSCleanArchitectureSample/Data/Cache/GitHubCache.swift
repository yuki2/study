//
//  GitHubCache.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/15.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

class GitHubCache{
    
    private static let TIME_STAMP = "time_stamp"
    private static let CACHE = "cache"
    
    private static let EXPIRE_TIME: Double = 30
    
    private static let users_path = "users.plist"
    
    let serialQueue = dispatch_queue_create("com.githubcache.serial", DISPATCH_QUEUE_SERIAL)
    
    func fetchUsers(completion:([UserEntity])->Void){
        dispatch_async(serialQueue, {
            var users:[UserEntity] = []
            
            let dict = FileManager.sharedManager.loadDictionary(GitHubCache.users_path)
            if !self.isExpired(dict){
                if let usersJson = dict[GitHubCache.CACHE] as? [String]{
                    users = usersJson.map{Mapper<UserEntity>().map($0)!}
                }
            }
            
            completion(users)
        })
    }
    
    func putUsers(users: [UserEntity]){
        dispatch_async(serialQueue, {
            var dictionary: [String:AnyObject] = [:]
            dictionary[GitHubCache.TIME_STAMP] = NSDate().timeIntervalSince1970
            let usersJson = users.map{Mapper().toJSONString($0, prettyPrint: true)!}
            dictionary[GitHubCache.CACHE] = usersJson
            FileManager.sharedManager.saveDictionary(GitHubCache.users_path, dictionary: dictionary)
        })
    }
    
    private func isExpired(dict: [String:AnyObject]) -> Bool{
        let maybeTimeStamp = dict[GitHubCache.TIME_STAMP] as? NSTimeInterval
        if let timeStamp = maybeTimeStamp {
            return (NSDate().timeIntervalSince1970 - timeStamp) > GitHubCache.EXPIRE_TIME
        }else{
            return false
        }
        
    }
    
}

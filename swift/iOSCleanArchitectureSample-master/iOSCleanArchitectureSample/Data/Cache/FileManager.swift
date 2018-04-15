//
//  FileManager.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/15.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Foundation

class FileManager{
    static let sharedManager = FileManager()
    
    func loadDictionary(path: String) -> [String:AnyObject]{
        let mayDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first
        guard let directory = mayDirectory else{
            return [:]
        }
        
        let mayFilePath = NSURL(fileURLWithPath: directory).URLByAppendingPathComponent(path).path
        guard let filePath = mayFilePath else{
            return [:]
        }
        guard let loadedDictionary = NSDictionary(contentsOfFile: filePath) as? [String:AnyObject] else{
            return [:]
        }
        
        return loadedDictionary
    }
    
    func saveDictionary(path: String, dictionary: [String:AnyObject]){
        let mayDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first
        guard let directory = mayDirectory else{
            return
        }
        
        let mayFilePath = NSURL(fileURLWithPath: directory).URLByAppendingPathComponent(path).path
        guard let filePath = mayFilePath else{
            return
        }
        
        let writableDict = dictionary as NSDictionary
        writableDict.writeToFile(filePath, atomically: true)
    }
}
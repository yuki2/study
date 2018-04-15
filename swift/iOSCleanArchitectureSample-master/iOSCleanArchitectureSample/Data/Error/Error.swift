//
//  NSURLError.swift
//  iOSCleanArchitectureSample
//
//  Created by 小川祐樹 on 2016/03/17.
//  Copyright © 2016年 Ogawa Yuki. All rights reserved.
//

import Foundation

extension NSError {
    static func InvalidParameter() -> NSError {
        return NSError(domain: "InvalidParameter", code: -1, userInfo: nil)
    }
    
    static func UnexpectedType() -> NSError {
        return NSError(domain: "UnexpectedType", code: -1, userInfo: nil)
    }
}
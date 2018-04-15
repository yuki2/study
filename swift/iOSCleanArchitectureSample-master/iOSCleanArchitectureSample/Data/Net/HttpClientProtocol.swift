//
//  HttpClientProtocol.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/15.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Foundation
import RxSwift

protocol HttpClientProtocol: class {
    func get
        (url: NSURL, parameters: [String : String]?, headers: [String : String]?) -> Observable<AnyObject>
    
    func post (url: NSURL, parameters: [String:String]?, headers: [String:String]?) -> Observable<AnyObject>
}
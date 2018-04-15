//
//  MockHttpClient.swift
//  iOSCleanArchitectureSample
//
//  Created by 小川祐樹 on 2016/03/17.
//  Copyright © 2016年 Ogawa Yuki. All rights reserved.
//

import Foundation
@testable import iOSCleanArchitectureSample
import RxSwift

class MockHttpClient: HttpClientProtocol{
    
    let mockJson: AnyObject
    
    init(mockJson: AnyObject){
        self.mockJson = mockJson
    }
    
    func get
        (url: NSURL, parameters: [String : String]?, headers: [String : String]?) -> Observable<AnyObject>{
            return Observable.just(mockJson)
    }
    
    func post (url: NSURL, parameters: [String:String]?, headers: [String:String]?) -> Observable<AnyObject>{
        return Observable.just(mockJson)
    }
}

//
//  HttpClient.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/15.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Foundation

import Alamofire
import RxSwift
import Foundation

class HttpClient: HttpClientProtocol {
    
    private static let manager: Manager = Alamofire.Manager()
    
    func get
        (url: NSURL, parameters: [String : String]? = nil, headers: [String : String]? = nil) -> Observable<AnyObject> {
            return action(Alamofire.Method.GET, url: url, parameters: parameters, headers: headers)
    }
    
    func post (url: NSURL, parameters: [String:String]? = nil, headers: [String:String]? = nil) -> Observable<AnyObject> {
            return action(.POST, url: url, parameters: parameters, headers: headers)
    }
    
    private func action
        (method: Alamofire.Method, url: NSURL, parameters: [String:String]?, headers: [String:String]?) -> Observable<AnyObject> {
            let mayRequest = HttpClient.manager.request(method, url, parameters: parameters, encoding: ParameterEncoding.URL).request
            guard let request = mayRequest?.mutableCopy() as? NSMutableURLRequest else{
                return Observable.error(NSError.InvalidParameter())
            }
            
            let mutableRequest = setHeader(headers, mutableRequest: request)
            return HttpClient.manager.session.rx_JSON(mutableRequest)
    }
    
    private func setHeader(headers: [String:String]?, mutableRequest: NSMutableURLRequest) -> NSMutableURLRequest {
        if let headers = headers {
            for (key, value) in headers {
                mutableRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        return mutableRequest
    }
    
}
//
//  GitHubAPIClient.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/14.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Alamofire
import RxSwift
import RxCocoa
import ObjectMapper

class GitHubAPIClient: GitHubAPIProtocol {
    
    // MARK: - Properties
    
    private let baseURL = "https://api.github.com"
    
    let httpClient: HttpClientProtocol
    
    init(httpClient: HttpClientProtocol){
        self.httpClient = httpClient
    }
    
    // MARK: - Instance methods
    func fetchUsers() -> Observable<[UserEntity]> {
        guard let path = self.buildPath("users") else {
            return Observable.error(NSError.InvalidParameter())
        }
        
        return self.httpClient.get(path, parameters: nil, headers: nil)
            .map { json in
                guard let json = json as? [AnyObject] else {
                    throw NSError.UnexpectedType()
                }
                return json.flatMap{
                    Mapper<UserEntity>().map($0)
                }
        }
    }
    
    func fetchUserDetail(user: UserEntity) -> Observable<UserEntity>{
        guard let urlStr = user.url, url = NSURL(string: urlStr) else {
            return Observable.error(NSError.InvalidParameter())
        }
        
        return self.httpClient.get(url, parameters: nil, headers: nil)
            .map {json in
                return Mapper<UserEntity>().map(json) ?? UserEntity()
        }
    }
    
    // MARK: - Private methods
    private func buildPath(path: String) -> NSURL? {
        let trimmedPath = path.hasPrefix("/") ? path.substringFromIndex(path.startIndex.successor()) : path
        let path = self.baseURL + "/" + trimmedPath
        return NSURL(string: path)!
    }
}

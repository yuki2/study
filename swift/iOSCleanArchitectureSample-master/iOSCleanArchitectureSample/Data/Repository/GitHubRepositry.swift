//
//  GithubRepositry.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/14.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Foundation
import RxSwift

class GitHubRepositry: GitHubRepositoryProtocol {
    
    static let sharedRepository = GitHubRepositry()
    
    var dataStoreFactory: GitHubDataStoreFactory!
    
    func fetchUsers() -> Observable<[UserEntity]> {
        let discDataStore = self.dataStoreFactory.createDiscDataStore()
        return discDataStore.fetchUsers()
            .flatMap ({users -> Observable<[UserEntity]> in
                if users.isEmpty {
                    let cloudDataStore = self.dataStoreFactory.createCloudDataStore()
                    return cloudDataStore.fetchUsers()
                }else{
                    return Observable.just(users)
                }
        })
    }
    
}

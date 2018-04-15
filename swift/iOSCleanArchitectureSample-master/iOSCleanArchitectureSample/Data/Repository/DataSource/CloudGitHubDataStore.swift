//
//  CloudGithubDataStore.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/14.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Foundation
import RxSwift

class CloudGitHubDataStore {
    
    let client: GitHubAPIProtocol
    let cache: GitHubCache
    
    init(client: GitHubAPIProtocol, cache: GitHubCache) {
        self.client = client
        self.cache = cache
    }
    
    func fetchUsers() -> Observable<[UserEntity]> {
        return self.client.fetchUsers()
            .doOnNext({users in
                self.cache.putUsers(users)
            })
    }
}

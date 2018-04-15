//
//  DiscGitHubDataStore.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/16.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Foundation
import RxSwift

class DiscGitHubDataStore {
    
    let cache: GitHubCache
    
    init(cache: GitHubCache) {
        self.cache = cache
    }
    
    func fetchUsers() -> Observable<[UserEntity]> {
        return Observable.create({observer in
            self.cache.fetchUsers({users in
                observer.onNext(users)
                observer.onCompleted()
            })
            return NopDisposable.instance
            })
    }
}
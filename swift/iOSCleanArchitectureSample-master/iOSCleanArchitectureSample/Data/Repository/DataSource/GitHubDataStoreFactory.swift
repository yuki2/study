//
//  GithubDataStoreFactory.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/14.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Foundation

class GitHubDataStoreFactory{
    
    static let sharedFactory = GitHubDataStoreFactory()
    
    var client: GitHubAPIProtocol!
    var cache: GitHubCache!
    
    func createCloudDataStore() -> CloudGitHubDataStore{
        return CloudGitHubDataStore(client: self.client, cache: self.cache)
    }
    
    func createDiscDataStore() -> DiscGitHubDataStore{
        return DiscGitHubDataStore(cache: self.cache)
    }
    
}

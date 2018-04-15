//
//  GetUserList.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/15.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Foundation
import RxSwift

class GetUserList{
    
    private let githubRepository: GitHubRepositoryProtocol
    
    init(githubRepository: GitHubRepositoryProtocol) {
        self.githubRepository = githubRepository
    }
    
    
    func execute() -> Observable<[UserEntity]>{
        return githubRepository.fetchUsers()
    }
}

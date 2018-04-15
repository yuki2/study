//
//  GitHubAPIProtocol.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/15.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Foundation
import RxSwift

protocol GitHubAPIProtocol {
    func fetchUsers() -> Observable<[UserEntity]>;
}

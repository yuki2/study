//
//  UserListView.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/15.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Foundation

protocol UserListView : class{
    func showLoading()
    func hideLoading()
    
    func renderUserList(users: [UserEntity])
}
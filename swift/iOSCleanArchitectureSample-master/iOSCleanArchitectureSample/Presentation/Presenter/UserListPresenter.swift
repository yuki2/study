//
//  UserListPresenter.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/15.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Foundation
import RxSwift

class UserListPresenter {
    
    private weak var userListView: UserListView?
    private let getUserListUseCase: GetUserList
    private let disposeBag = DisposeBag()
    
    init(userListView: UserListView, getUserList: GetUserList) {
        self.userListView = userListView
        self.getUserListUseCase = getUserList
    }
    
    func viewDidLoad(){
        self.showLoading()
        self.getUserList()
    }
    
    func getUserList(){
        self.getUserListUseCase.execute()
            .observeOn(Dependencies.sharedDependencies.mainScheduler)
            .subscribe(
                onNext: {[unowned self] users in
                    self.renderUserList(users)
                },
                onError: {[unowned self] error in
                    self.hideLoading()
                },
                onCompleted: {[unowned self] in
                    self.hideLoading()
                },
                onDisposed: nil)
            .addDisposableTo(self.disposeBag)
    }
    
    func showLoading(){
        self.userListView?.showLoading()
    }
    
    func hideLoading(){
        self.userListView?.hideLoading()
    }
    
    func renderUserList(users: [UserEntity]){
        self.userListView?.renderUserList(users)
    }
}
//
//  UserListViewController.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/15.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Foundation

import UIKit

class UserListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UserListView {
    
    private var tableView: UITableView
    private var indicator: UIActivityIndicatorView
    
    private var presenter: UserListPresenter!
    private var users: [UserEntity] = []
    
    required init(coder aDecoder: NSCoder) {
        self.tableView = UITableView(frame: CGRectZero)
        self.indicator = UIActivityIndicatorView(activityIndicatorStyle: .White)
        super.init(coder: aDecoder)!
        
    }
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        self.tableView = UITableView(frame: CGRectZero)
        self.indicator = UIActivityIndicatorView(frame: CGRectZero)
        super.init(nibName: nil, bundle: nil)
    }
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dependencyInjection()
        
        self.setupTableView()
        self.setupIndicator()
        
        self.presenter.viewDidLoad()
    }
    
    private func setupTableView(){
        self.tableView.frame = self.view.frame
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        self.view.addSubview(self.tableView)
    }
    
    private func setupIndicator(){
        self.indicator.frame = CGRectMake(0, 0, 50, 50);
        self.indicator.center = self.view.center;
        self.indicator.hidden = true
        self.indicator.backgroundColor = UIColor.grayColor()
        self.view.addSubview(self.indicator)
    }
    
    private func dependencyInjection(){
        let getUserListUseCase = GetUserList(githubRepository: GitHubRepositry.sharedRepository)
        self.presenter = UserListPresenter(userListView: self, getUserList: getUserListUseCase)
    }
    
    func showLoading() {
        self.indicator.hidden = false
        self.indicator.startAnimating()
    }
    
    func hideLoading() {
        self.indicator.hidden = true
        self.indicator.stopAnimating()
    }
    
    func renderUserList(users: [UserEntity]) {
        self.users = users
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = String(user.login!)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let user = users[indexPath.row]
        UIApplication.sharedApplication().openURL(NSURL(string: user.html_url!)!)
    }
    
}
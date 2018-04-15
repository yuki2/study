//
//  GitHubAPIClientTests.swift
//  iOSCleanArchitectureSample
//
//  Created by 小川祐樹 on 2016/03/17.
//  Copyright © 2016年 Ogawa Yuki. All rights reserved.
//

import XCTest
import RxSwift

@testable import iOSCleanArchitectureSample

class GitHubAPIClientTests: XCTestCase {
    
    private let disposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testFailToFetchUsers() {
        let failFetchUsersExpectation = self.expectationWithDescription("Fail to fetch users")
        
        let client: GitHubAPIClient = GitHubAPIClient(httpClient: MockHttpClient(mockJson: ""))
        client.fetchUsers().subscribe(
            onNext: {users in
                print(users)
            },
            onError: {error in
                XCTAssertNotNil(error)
                failFetchUsersExpectation.fulfill()
            },
            onCompleted: {
            },
            onDisposed: nil)
            .addDisposableTo(self.disposeBag)
        
        self.waitForExpectationsWithTimeout(5, handler:nil)
    }
    
    func testSucceedInFetchUsers() {
        let succeedInFetchUsersExpectation = self.expectationWithDescription("Succeed in fetch users")
        
        let filePath = NSBundle(forClass: GitHubAPIClientTests.self).pathForResource("github_users", ofType: "json")!
        let data = NSData(contentsOfFile: filePath)!
        let mockJson = try! NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
        let client: GitHubAPIClient = GitHubAPIClient(httpClient: MockHttpClient(mockJson: mockJson))
        client.fetchUsers().subscribe(
            onNext: {users in
                XCTAssertEqual(users.count, 30)
                
                let user = users.first!
                XCTAssertEqual(user.login, "mojombo")
                XCTAssertEqual(user.id, 1)
                XCTAssertEqual(user.avatar_url, "https://avatars.githubusercontent.com/u/1?v=3")
                XCTAssertEqual(user.gravatar_id, "")
                XCTAssertEqual(user.url, "https://api.github.com/users/mojombo")
                XCTAssertEqual(user.html_url, "https://github.com/mojombo")
                XCTAssertEqual(user.followers_url, "https://api.github.com/users/mojombo/followers")
                XCTAssertEqual(user.following_url, "https://api.github.com/users/mojombo/following{/other_user}")
                XCTAssertEqual(user.gists_url, "https://api.github.com/users/mojombo/gists{/gist_id}")
                XCTAssertEqual(user.starred_url, "https://api.github.com/users/mojombo/starred{/owner}{/repo}")
                XCTAssertEqual(user.subscriptions_url, "https://api.github.com/users/mojombo/subscriptions")
                XCTAssertEqual(user.organizations_url, "https://api.github.com/users/mojombo/orgs")
                XCTAssertEqual(user.repos_url, "https://api.github.com/users/mojombo/repos")
                XCTAssertEqual(user.events_url, "https://api.github.com/users/mojombo/events{/privacy}")
                XCTAssertEqual(user.received_events_url, "https://api.github.com/users/mojombo/received_events")
                XCTAssertEqual(user.type, "User")
                XCTAssertEqual(user.site_admin, false)
                
                succeedInFetchUsersExpectation.fulfill()
            },
            onError: {error in
                print(error)
            },
            onCompleted: {
            },
            onDisposed: nil)
            .addDisposableTo(self.disposeBag)
        
        self.waitForExpectationsWithTimeout(5, handler:nil)
    }

}

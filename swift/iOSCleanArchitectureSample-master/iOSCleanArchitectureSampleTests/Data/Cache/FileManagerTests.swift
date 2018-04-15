//
//  FileManagerTests.swift
//  iOSCleanArchitectureSample
//
//  Created by 小川祐樹 on 2016/03/19.
//  Copyright © 2016年 Ogawa Yuki. All rights reserved.
//

import XCTest
@testable import iOSCleanArchitectureSample

class FileManagerTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testLoadDicionary() {
        let dict = ["abc":"123", "cde":"456"]
        FileManager.sharedManager.saveDictionary("test.plist", dictionary: dict)
        let loadedDict = FileManager.sharedManager.loadDictionary("test.plist")
        XCTAssertEqual(dict["abc"], loadedDict["abc"] as? String)
        XCTAssertEqual(dict["cde"], loadedDict["cde"] as? String)
    }

}

//
//  Dependencies.swift
//  iOSCleanArchitectureSample
//
//  Created by yuki2 on 2016/03/14.
//  Copyright © 2016年 yuki2. All rights reserved.
//

import Foundation
import RxSwift

class Dependencies{
    static let sharedDependencies = Dependencies() // Singleton
    
    let backgroundWorkScheduler: ImmediateSchedulerType
    let mainScheduler: SerialDispatchQueueScheduler
    
    private init() {
        
        let operationQueue = NSOperationQueue()
        operationQueue.maxConcurrentOperationCount = 2
        operationQueue.qualityOfService = NSQualityOfService.UserInitiated
        backgroundWorkScheduler = OperationQueueScheduler(operationQueue: operationQueue)
        
        mainScheduler = MainScheduler.instance
    }
}

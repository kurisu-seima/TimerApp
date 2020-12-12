//
//  TimerManager.swift
//  SampleTimerApp
//
//  Created by くりすせいま on 2020/12/06.
//  Copyright © 2020 星舞. All rights reserved.
//

import Foundation

class TimerManager {
    
    static var timer = Timer()
    
    static var count = 10
    
    static func pause() {
        TimerManager.timer.invalidate()
    }
    
    static func reset() {
        self.count = 10
    }
}

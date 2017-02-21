//
//  Value.swift
//  mobile-distribution
//
//  Created by 郭辉 on 2016/11/25.
//  Copyright © 2016年 CCT. All rights reserved.
//

import Foundation

struct Value<V> {
    
    /// 生成一个适应不同屏幕的变量
    ///
    /// - Parameters:
    ///   - for3_5: 3.5寸屏幕
    ///   - for4_0: 4.0寸屏幕
    ///   - for4_7: 4.7寸屏幕
    ///   - for5_5: 5.5寸屏幕
    /// - Returns: Value
    static func adjust<V>(for3_5: V, for4_0: V, for4_7: V, for5_5: V) -> V {
        switch UIScreen.sk_inch() {
        case .inch3_5:
            return for3_5
        case .inch4_0:
            return for4_0
        case .inch4_7:
            return for4_7
        case .inch5_5:
            return for5_5
        }
    }
}

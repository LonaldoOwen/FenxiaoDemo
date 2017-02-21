//
//  Color.swift
//  mobile-distribution
//
//  Created by 郭辉 on 2016/11/7.
//  Copyright © 2016年 CCT. All rights reserved.
//

import UIKit

/// 工程标准颜色
public extension UIColor {
    static var cdc_A: UIColor {
        return UIColor(rgbHex: 0x8f63bd)
    }
    static var cdc_A1: UIColor {
        return UIColor(rgbHex: 0x7f4eb3)
    }
    
    static var cdc_B: UIColor {
        return UIColor(rgbHex: 0xa878da)
    }
    
    static var cdc_B1: UIColor {
        return UIColor(rgbHex: 0x9a69cd)
    }
    
    static var cdc_C: UIColor {
        return UIColor(rgbHex: 0xe8d3fd)
    }
    
    static var cdc_D: UIColor {
        return UIColor(rgbHex: 0xf1f1f9)
    }
    
    static var cdc_E: UIColor {
        return UIColor(rgbHex: 0xcccccc)
    }
    
    static var cdc_F: UIColor {
        return UIColor(rgbHex: 0xcfcfcf)
    }
    
    static var cdc_G: UIColor {
        return UIColor(rgbHex: 0xe3e3e3)
    }
    
    static var cdc_H: UIColor {
        return UIColor(rgbHex: 0xe0e0e0)
    }
    
    static var cdc_I: UIColor {
        return UIColor(rgbHex: 0xe9e9e9)
    }
    
    static var cdc_J: UIColor {
        return UIColor(rgbHex: 0xf2f2f2)
    }
    
    static var cdc_K: UIColor {
        return UIColor(rgbHex: 0xf65241)
    }
    
    static var cdc_L: UIColor {
        return UIColor(rgbHex: 0xefa700)
    }
    
    static var cdc_M: UIColor {
        return UIColor(rgbHex: 0x30b230)
    }
    
    static var cdc_N: UIColor {
        return UIColor(rgbHex: 0x474747)
    }
    
    static var cdc_O: UIColor {
        return UIColor(rgbHex: 0x737373)
    }
    
    static var cdc_P: UIColor {
        return UIColor(rgbHex: 0xa6a6a6)
    }
    
    static var cdc_Q: UIColor {
        return UIColor(rgbHex: 0xbababa)
    }
    
    static var cdc_R: UIColor {
        return UIColor(rgbHex: 0xd4d4d4)
    }
    
    static var cdc_S: UIColor {
        return UIColor(rgbHex: 0x7a48b1)
    }
    
    static var cdc_S1: UIColor {
        return UIColor(rgbHex: 0x6b35a7)
    }
    
    static var cdc_T: UIColor {
        return UIColor(rgbHex: 0xa878da)
    }
    
    static var cdc_Y: UIColor {
        return UIColor(rgbHex: 0xf4f4f7)
    }
    
    static var cdc_Z: UIColor {
        return UIColor(rgbHex: 0xf9f9fd)
    }
}



extension UIColor {
    
    /// 通过16进制颜色代码生成UIColor实例
    ///
    /// - Parameter rgbHex: rgb16进制
    convenience init(rgbHex: UInt32) {
        //self.init(rgb: rgbHex) // from UIColor+YYAdd.h
        self.init(
            red: CGFloat((rgbHex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbHex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbHex & 0x0000FF) / 255.0,
            alpha: 1 // 1:不透明；0:透明
        )
    }
    
//    convenience init(rgbaHex: UInt32) {
//        self.init(rgba: rgbaHex)
//    }
//    
//    convenience init(rgbHex: UInt32, alpha: CGFloat) {
//        self.init(rgb: rgbHex, alpha: alpha)
//    }
    
}

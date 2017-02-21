//
//  Font.swift
//  mobile-distribution
//
//  Created by 郭辉 on 2016/11/17.
//  Copyright © 2016年 CCT. All rights reserved.
//

import UIKit

public extension UIFont {
    
    /// 粗体
    public var bold: UIFont {
        return UIFont(descriptor: fontDescriptor.withSymbolicTraits(.traitBold)!, size: pointSize)
    }
    
    public static var cdc_0: UIFont {
        return UIFont.systemFont(ofSize: 23)
    }
    
    /// 22
    public static var cdc_1: UIFont {
        return UIFont.systemFont(ofSize: 22)
    }
    
    /// 20
    public static var cdc_2: UIFont {
        return UIFont.systemFont(ofSize: 20)
    }
    
    /// 18
    public static var cdc_3: UIFont {
        return UIFont.systemFont(ofSize: 18)
    }
    
    /// 16
    public static var cdc_4: UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
    /// 14
    public static var cdc_5: UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    
    /// 12
    public static var cdc_6: UIFont {
        return UIFont.systemFont(ofSize: 12)
    }
    
    /// 10
    public static var cdc_7: UIFont {
        return UIFont.systemFont(ofSize: 10)
    }
    
}

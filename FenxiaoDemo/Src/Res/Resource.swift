//
//  Resource.swift
//  mobile-distribution
//
//  Created by 郭辉 on 2016/11/7.
//  Copyright © 2016年 CCT. All rights reserved.
//

import Foundation
import SunkaKit

/// 资源
struct Resource {
    
    /// 图片
    struct Image {
        private init() {}
        
        static let cacheURL: URL = {
            return URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!).appendingPathComponent("Image", isDirectory: true)
        }()
        
        static func getPNG(withName name: String) -> UIImage? {
            guard let path = Bundle.main.path(forResource: name, ofType: "png") else { return nil }
            return UIImage(contentsOfFile: path)
        }
        
        /// 获取指定size的iconfont
        ///
        /// - Parameter size: font size
        /// - Returns: UIFont
        static func getIconFont(withSize size: CGFloat) -> UIFont {
            return UIFont(name: "khcdcicon", size: size)!
        }
        
        /// 生成1像素的横线图片，有缓存，优先从缓存加载
        ///
        /// - Parameters:
        ///   - width: 横线长度
        ///   - color: 横线颜色
        /// - Returns: UIImage
        static func horizontalOnePx(forWidth width: CGFloat, _ color: UIColor) -> UIImage? {
            return UIImage.sk_horizontalOnePx(forWidth: width, color: color)
        }
        
        /// 生成1像素的竖线图片，有缓存，优先从缓存加载
        ///
        /// - Parameters:
        ///   - height: 竖线长度
        ///   - color: 竖线颜色
        /// - Returns: UIImage
        static func verticalOnePx(forHeight height: CGFloat, _ color: UIColor) -> UIImage? {
            return UIImage.sk_verticalOnePx(forHeight: height, color: color)
        }
        
    }
    
}

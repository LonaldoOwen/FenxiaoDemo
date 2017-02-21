//
//  Image.swift
//  mobile-distribution
//
//  Created by 郭辉 on 2016/11/24.
//  Copyright © 2016年 CCT. All rights reserved.
//

import Foundation

extension UIFont {
    
    static func cdc_icon(withSize size: CGFloat) -> UIFont {
        guard let cdc_icon = UIFont(name: "khcdcicon", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return cdc_icon
    }
    
}

extension UIImage {
    /// 生成1像素的横线图片
    ///
    /// - Parameter color: 横线颜色
    /// - Returns: UIImage
    static func horizontalOnePx(forColor color: UIColor) -> UIImage? {
        return UIImage.sk_horizontalOnePx(forWidth: 3, color: color)?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1))
    }
    
    /// 生成1像素的竖线图片，有缓存，优先从缓存加载
    ///
    /// - Parameters:
    ///   - height: 竖线长度
    ///   - color: 竖线颜色
    /// - Returns: UIImage
    static func verticalOnePx(forColor color: UIColor) -> UIImage? {
        return UIImage.sk_verticalOnePx(forHeight: 3, color: color)?.resizableImage(withCapInsets: UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0))
    }
}

struct Image {
    
    /// 获取指定size的iconfont
    ///
    /// - Parameter size: font size
    /// - Returns: UIFont
    static func iconFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "khcdcicon", size: size)!
    }
    
    /// 生成1像素的横线图片
    ///
    /// - Parameter color: 横线颜色
    /// - Returns: UIImage
    static func horizontalOnePx(forColor color: UIColor) -> UIImage? {
        return UIImage.sk_horizontalOnePx(forWidth: 3, color: color)?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1))
    }
    
    /// 生成1像素的竖线图片，有缓存，优先从缓存加载
    ///
    /// - Parameters:
    ///   - height: 竖线长度
    ///   - color: 竖线颜色
    /// - Returns: UIImage
    static func verticalOnePx(forColor color: UIColor) -> UIImage? {
        return UIImage.sk_verticalOnePx(forHeight: 3, color: color)?.resizableImage(withCapInsets: UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0))
    }
}

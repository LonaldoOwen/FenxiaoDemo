//
//  TourHomeTag.swift
//  FenxiaoDemo
//
//  Created by owen on 17/1/30.
//  Copyright © 2017年 owen. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

//
struct TourHomeTag {
    let id: String
    let name: String
    let text: NSAttributedString
    let subTags: [TourHomeTag]
    var isPresent = false
    
    static func model(_ object: Any) -> [TourHomeTag] {
        var tags = [TourHomeTag]()
        guard let jsonArray = object as? [[String:Any]] else {
            return tags
        }
        
        // 不可行
        // 修改subTags: ($0["sub_name"] as! Array)，解决
        tags = jsonArray.map {
            TourHomeTag(
                id: $0["id"] as! String,
                name: $0["name"] as! String,
                text: NSAttributedString(string: $0["name"] as! String, attributes: [NSFontAttributeName: UIFont.cdc_4, NSForegroundColorAttributeName: UIColor.cdc_N]),
                subTags: ($0["sub_name"] as! [[String:Any]]).map {
                    TourHomeTag(
                        id: $0["id"] as! String,
                        name: $0["name"] as! String,
                        text: NSAttributedString(string: $0["name"] as! String, attributes: [NSFontAttributeName: UIFont.cdc_5, NSForegroundColorAttributeName: UIColor.cdc_N]),
                        subTags: [TourHomeTag](),
                        isPresent: false
                    )
                },
                isPresent: false
            )
        }
//        let tempArray = tags as Array
//        print("tempArray is \(tempArray)")
//        print("tags is \(tags)")
        
        // 可行，但并不好
        /*
        for item in jsonArray {
            var subNames = [TourHomeTag]()
            let array = item["sub_name"] as? [[String:Any]]
            for subItem in array! {
                let subthg = TourHomeTag(
                    id: subItem["id"] as! String,
                    name: subItem["name"] as! String,
                    text: NSAttributedString(string: subItem["name"] as! String, attributes: [NSFontAttributeName: UIFont.cdc_5, NSForegroundColorAttributeName: UIColor.cdc_N]),
                    subTags: [TourHomeTag](),
                    isPressent: false
                )
                subNames.append(subthg)
            }
            
            let thg = TourHomeTag(
                id: item["id"] as! String,
                name: item["name"] as! String,
                text: NSAttributedString(string: item["name"] as! String, attributes: [NSFontAttributeName: UIFont.cdc_4, NSForegroundColorAttributeName: UIColor.cdc_N]),
                subTags: subNames,
                isPressent: true
            )

            tags.append(thg)
        }
        */
        return tags
    }
}


//
extension UIImage {

    struct TourHome {
        static var SubTagNormalBackground: UIImage? {
            // 绘制图片
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 40, height: 30), false, 0)
            let context = UIGraphicsGetCurrentContext()
            context?.setFillColor(UIColor.red.cgColor)
            context?.addRect(CGRect(x: 0, y: 0, width: 40, height: 30))
            context?.drawPath(using: .fillStroke)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
        
        static var SubTagHighlightedBackground: UIImage? {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 40, height: 30), false, 0)
            let context = UIGraphicsGetCurrentContext()
            context?.setFillColor(UIColor.green.cgColor)
            context?.addRect(CGRect(x: 0, y: 0, width: 40, height: 30))
            context?.drawPath(using: .fillStroke)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
    }
}


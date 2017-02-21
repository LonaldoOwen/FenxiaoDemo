//
//  TourHomeTagSectionItemBackgroundView.swift
//  FenxiaoDemo
//
//  Created by owen on 17/2/20.
//  Copyright © 2017年 owen. All rights reserved.
//

import UIKit

class TourHomeTagSectionItemBackgroundView: UICollectionReusableView {
    
    static let id = "TourHomeTagSectionItemBackgroundView"
    
//    fileprivate let topSeparator: UIImageView = {
//        let separator = UIImageView(image: UIImage.horizontalOnePx(forColor: .cdc_G))
//        return separator
//    }()
//    
//    fileprivate let bottomSeparator: UIImageView = {
//        let separator = UIImageView(image: UIImage.horizontalOnePx(forColor: .cdc_G))
//        return separator
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cdc_Z
//        addSubview(topSeparator)
//        topSeparator.snp.makeConstraints { (make) in
//            make.left.right.top.equalTo(self)
//        }
//        addSubview(bottomSeparator)
//        bottomSeparator.snp.makeConstraints { (make) in
//            make.left.right.bottom.equalTo(self)
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
        
}

//
//  TourHomeTagItemCell.swift
//  FenxiaoDemo
//
//  Created by owen on 17/1/26.
//  Copyright © 2017年 owen. All rights reserved.
//

import UIKit

class TourHomeTagItemCell: UICollectionViewCell {
    static let id = "TourHomeTagItemCell"
    
    let button: UIButton = {
        var button = UIButton()
        button.setBackgroundImage(UIImage.TourHome.SubTagNormalBackground, for: .normal)
        button.setBackgroundImage(UIImage.TourHome.SubTagHighlightedBackground, for: .highlighted)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        // add constraints
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        // add target action
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    var homeTag: TourHomeTag? {
        didSet {
            button.setAttributedTitle(homeTag?.text, for: .normal)
        }
    }
    
    @objc fileprivate func buttonClicked() {
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
}

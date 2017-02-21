//
//  TourHomeTagSectionHeaderView.swift
//  FenxiaoDemo
//
//  Created by owen on 17/1/26.
//  Copyright © 2017年 owen. All rights reserved.
//

import UIKit

class TourHomeTagSectionHeaderView: UICollectionReusableView {
    
    static let id = "TourHomeTagSectionHeaderView"
    
    fileprivate let control: UIControl = {
        let control = UIControl()
        control.backgroundColor = .orange
        return control
    }()
    
    fileprivate let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.cdc_A
//        let color1: UIColor = UIColor.cdc_A
//        let color2: UIColor = UIColor.cdc_N
        //label.textColor = .black
        return label
    }()
    
    var controlClickedCall: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.green
        //self.translatesAutoresizingMaskIntoConstraints = false
        control.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(control)
        control.addTarget(self, action: #selector(controlClicked), for: .touchUpInside)
        // add constraints
        control.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        self.trailingAnchor.constraint(equalTo: control.trailingAnchor, constant: 20).isActive = true
        control.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: control.bottomAnchor).isActive = true
        
        addSubview(label)
        // add constraints
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
        var homeTag: TourHomeTag? {
            didSet {
                label.attributedText = homeTag?.text
                //label.text = "label"
                print("")
            }
    }
    
    @objc fileprivate func controlClicked() {
        guard let call = controlClickedCall else { return }
        call()
        print("call \"controlClickedCall\"")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

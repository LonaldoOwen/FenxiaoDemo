//
//  TourHomeController.swift
//  FenxiaoDemo
//
//  Created by owen on 17/1/26.
//  Copyright © 2017年 owen. All rights reserved.
//

import UIKit

class TourHomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    fileprivate let collectionView: UICollectionView = {
        // 实例化layout
        //let layout = UICollectionViewFlowLayout()
        let layout = CollectionViewAlignLeftFlowLayout()
        // 配置layout属性
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layout.itemSize = CGSize(width: 100, height: 30)
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 11
        //layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 56)
        layout.headerSize = CGSize(width: UIScreen.main.bounds.width, height: 56)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        // 注册item
        collectionView.register(TourHomeTagItemCell.classForCoder(), forCellWithReuseIdentifier: TourHomeTagItemCell.id)
        // 注册header
        collectionView.register(TourHomeTagSectionHeaderView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: TourHomeTagSectionHeaderView.id)
        // 注册items 背景
        collectionView.register(TourHomeTagSectionItemBackgroundView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionItemsBackground, withReuseIdentifier: TourHomeTagSectionItemBackgroundView.id)
        return collectionView
    }()
    
//    fileprivate var tags = { () -> [[String : Array<String>]] in 
//        var array1: [String] = ["美国", "德国", "法国", "日本", "英吉利", "毛里求斯", "韩国"];
//        var array2: [String] = ["上海", "广州", "深圳", "大理", "重庆", "德阳"];
//        var tag1: [String:Array] = ["出境游": array1]
//        var tag2: [String:Array] = ["国内游": array2]
//        var tags = [tag1, tag2]
//        return tags
//    }()
    fileprivate var jsonArray = { () -> [[String : Any]] in
        var dic1: [String:Any] = [:]
        dic1["id"] = "2"
        dic1["name"] = "出境游"
        dic1["sub_name"] = {
            var dic1: [String:Any] = [:]
            dic1["id"] = "2"
            dic1["name"] = "England"
            var dic2: [String:Any] = [:]
            dic2["id"] = "3"
            dic2["name"] = "Franch"
            var dic3: [String:Any] = [:]
            dic3["id"] = "4"
            dic3["name"] = "Germany"
            var dic4: [String:Any] = [:]
            dic4["id"] = "5"
            dic4["name"] = "Italy"
            var dic5: [String:Any] = [:]
            dic5["id"] = "6"
            dic5["name"] = "Brazil"
            var dic6: [String:Any] = [:]
            dic6["id"] = "6"
            dic6["name"] = "America"
            var dic7: [String:Any] = [:]
            dic7["id"] = "6"
            dic7["name"] = "Russia"
            var dic8: [String:Any] = [:]
            dic8["id"] = "6"
            dic8["name"] = "Hongkong"
            var tempArray: [Any] = [dic1, dic2, dic3, dic4, dic5, dic6, dic7, dic8]
            return tempArray
        }()
        var dic2: [String:Any] = [:]
        dic2["id"] = "3"
        dic2["name"] = "国内游"
        dic2["sub_name"] = {
            var dic1: [String:Any] = [:]
            dic1["id"] = "2"
            dic1["name"] = "桂林"
            var dic2: [String:Any] = [:]
            dic2["id"] = "3"
            dic2["name"] = "阳朔"
            var tempArray: [Any] = [dic1, dic2]
            return tempArray
        }()
        var tags = [dic1, dic2]
        return tags
    }()
    
    fileprivate var presentCount = -1
    
    fileprivate var tags: [TourHomeTag] = [] {
        didSet {
            /**
             * 问题：未添加collectionView.reloadData()时，会crash
             */
            collectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        // add constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: 10).isActive = true
        collectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0).isActive = true
        print("///")
        
        //
        self.tags = TourHomeTag.model(self.jsonArray)
        print("get tags")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // data source
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //
        let cellCount: Int = tags[section].isPresent ? tags[section].subTags.count : 0
        return cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TourHomeTagItemCell.id, for: indexPath) as! TourHomeTagItemCell
        cell.backgroundColor = .blue
        //cell.button.setTitle("button", for: .normal)
        cell.homeTag = tags[indexPath.section].subTags[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //
        if kind == UICollectionElementKindSectionItemsBackground {
            print("背景：。。。")
            //let view = UIView() as! TourHomeTagSectionHeaderView
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionItemsBackground, withReuseIdentifier: TourHomeTagSectionItemBackgroundView.id, for: indexPath) as! TourHomeTagSectionItemBackgroundView
            return view
        } else {
            print("无背景。。。")
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: TourHomeTagSectionHeaderView.id, for: indexPath) as! TourHomeTagSectionHeaderView
//            let cellTags = tags[indexPath.section].subTags[indexPath.item]
//            view.label.text = cellTags.first
            view.homeTag = tags[indexPath.section]
            view.controlClickedCall = {
                //
                print("implement \"controlClickedCall\"")
                let index = self.tags.index(where: { (homeTag) -> Bool in
                    return homeTag.isPresent == true
                }) ?? -1
                
                if index != -1 && index != indexPath.section {
                    self.tags[index].isPresent = false
                }
                
                self.tags[indexPath.section].isPresent = !self.tags[indexPath.section].isPresent
                
                // 
                collectionView.performBatchUpdates({
                    collectionView.reloadData()
                }, completion: { (finished) in
                    if self.tags[indexPath.section].isPresent {
                        self.presentCount = indexPath.section
                        let layoutAttribute = collectionView.collectionViewLayout.layoutAttributesForSupplementaryView(ofKind: UICollectionElementKindSectionHeader, at: indexPath)
                        if let offset = layoutAttribute?.frame.origin {
                            // collectionView.sk_contentHeight???
                            //if offset.y + collectionView.frame.size.height <= collectionView.sk_contentHeight {
                            if offset.y + collectionView.frame.size.height <= collectionView.frame.size.height {

                                collectionView.setContentOffset(offset, animated: true)
                            } else {
                                var off = collectionView.contentOffset
                                off.y = collectionView.contentSize.height - collectionView.bounds.size.height + collectionView.contentInset.bottom
                                if off.y < 0 { off.y = 0 }
                                collectionView.setContentOffset(off, animated: true)
                            }
                        }
                    } else {
                        self.presentCount = -1
                    }
                })
            }
            return view
        }
    }
    
    
    // delegate
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

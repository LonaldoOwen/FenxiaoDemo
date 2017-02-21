//
//  CollectionViewAlignLeftFlowLayout.swift
//  FenxiaoDemo
//
//  Created by owen on 17/2/19.
//  Copyright © 2017年 owen. All rights reserved.
//

import UIKit

let UICollectionElementKindSectionItemsBackground = "UICollectionElementKindSectionBackground"
class CollectionViewAlignLeftFlowLayout: UICollectionViewLayout {

    // properties
    var minimumLineSpacing: CGFloat = 0
    var minimumInteritemSpacing: CGFloat = 0
    var itemSize: CGSize = CGSize(width: 50, height: 50)
    var headerSize: CGSize = .zero
    var footerSize: CGSize = .zero
    var sectionInset: UIEdgeInsets = .zero
    var needSectionItemsBackground = false //
    
    // attributes dictionary
    var itemAttributesInfo: [IndexPath: UICollectionViewLayoutAttributes] = [:]
    var headerAttributesInfo: [IndexPath: UICollectionViewLayoutAttributes] = [:]
    var itemsBackgroundAttributeInfo: [IndexPath: UICollectionViewLayoutAttributes] = [:]
    
    // 覆写prepare方法－－计算positions
    override func prepare() {
        super.prepare()
        
        // 移除所有attributes
        itemAttributesInfo.removeAll()
        headerAttributesInfo.removeAll()
        itemsBackgroundAttributeInfo.removeAll()
        
        guard let collectionView = collectionView else { return }
        
        // 开始计算布局
        let width = collectionView.frame.size.width
        // content size 起初高度为0
        _contentSize = CGSize(width: width, height: 0)
        let sections = collectionView.numberOfSections
        if sections == 0 { return }
        (0..<sections).forEach { (section) in
            // 计算header
            // 获取header size（在TourHomeController中实例化layout时设置的size）
            let headerSize = self.headerSize(forSection: section)
            if headerSize != .zero {
                let headerIndexPath = IndexPath(item: 0, section: section)
                // 实例化一个attributes（header）
                let headerAttributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, with: headerIndexPath)
                // 配置header属性
                headerAttributes.zIndex = 1000
                headerAttributes.frame = CGRect(x: 0, y: _contentSize.height, width: headerSize.width, height: headerSize.height)
                // 将相应indexPath上的header添加到字典中
                self.headerAttributesInfo[headerIndexPath] = headerAttributes
                // 调整content size
                _contentSize.height = headerAttributes.frame.maxY
            }
            
            //计算item
            var itemX = sectionInset.left
            var itemY = _contentSize.height + sectionInset.top
            var prevItemSize = CGSize.zero
            let items = collectionView.numberOfItems(inSection: section)
            (0..<items).forEach({ (item) in
                let itemIndexPath = IndexPath(item: item, section: section)
                let itemSize = self.itemSize(forIndexPath: itemIndexPath)
                if itemX + itemSize.width > width - sectionInset.right {
                    //  这一行放不下，放到下一行
                    itemX = sectionInset.left
                    itemY = itemY + prevItemSize.height + minimumLineSpacing
                    prevItemSize = .zero
                } else {
                    prevItemSize = itemSize
                }
                let itemFrame = CGRect(x: itemX, y: itemY, width: itemSize.width, height: itemSize.height)
                // 没增加一个item，itemX改变位置
                itemX += (itemSize.width + minimumInteritemSpacing)
                // 实例化attributes（item）
                let itemAttributes = UICollectionViewLayoutAttributes(forCellWith: itemIndexPath)
                // 配置item
                itemAttributes.zIndex = 100
                itemAttributes.frame = itemFrame
                // 将item 添加到字典
                itemAttributesInfo[itemIndexPath] = itemAttributes
            })
            // 计算item背景view
            if items > 0 {
                let backgroundX: CGFloat = 0
                let backgroundY: CGFloat = _contentSize.height
                let backgroundW: CGFloat = width
                _contentSize.height = itemAttributesInfo[IndexPath(item: items - 1 , section: section)]!.frame.maxY + sectionInset.bottom
                let backgroundH: CGFloat = _contentSize.height - backgroundY
                if needSectionItemsBackground {
                    let backgroundIndexPath = IndexPath(item: 0, section: section)
                    let backgroundAttributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: UICollectionElementKindSectionItemsBackground, with: backgroundIndexPath)
                    backgroundAttributes.zIndex = 1
                    backgroundAttributes.frame = CGRect(x: backgroundX, y: backgroundY, width: backgroundW, height: backgroundH)
                    itemsBackgroundAttributeInfo[backgroundIndexPath] = backgroundAttributes
                }
            }
        }
    }
    
    // 覆写collectionViewContentSize－－返回content size
    override var collectionViewContentSize: CGSize {
        return _contentSize
    }
    
    // 覆写layoutAttributesForElements(in:)－－返回attributes
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray: [UICollectionViewLayoutAttributes] = []
        //
        headerAttributesInfo.values.forEach { (attributes) in
            if rect.intersects(attributes.frame) {
                attributesArray.append(attributes)
            }
        }
        itemAttributesInfo.values.forEach { (attributes) in
            if rect.intersects(attributes.frame) {
                attributesArray.append(attributes)
            }
        }
        itemsBackgroundAttributeInfo.values.forEach { (attributes) in
            if rect.intersects(attributes.frame) {
                attributesArray.append(attributes)
            }
        }
        return attributesArray
    }
    
    // 覆写layoutAttributesForSupplementaryView(ofKind:at:)－－带header view
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if elementKind == UICollectionElementKindSectionHeader {
            if let attributes = headerAttributesInfo[indexPath] {
                return attributes
            }
        }
        return super.layoutAttributesForSupplementaryView(ofKind: elementKind, at: indexPath)
    }
    
    // MARK: private methods
    
    fileprivate var _contentSize: CGSize = .zero
    
    fileprivate func itemSize(forIndexPath indexPath: IndexPath) -> CGSize {
        
        print("itemSize: \(itemSize)")
        return itemSize
    }
    
    fileprivate func headerSize(forSection section: Int) -> CGSize {
        return headerSize
    }
}

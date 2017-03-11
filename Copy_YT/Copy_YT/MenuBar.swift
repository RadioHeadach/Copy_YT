//
//  MenuBar.swift
//  Copy_YT
//
//  Created by ROOSTERLIN on 2017/3/11.
//  Copyright © 2017年 ROOSTERLIN. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionVIew: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 239, green: 32, blue: 31)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellID"
    let icons = ["home", "trending", "subscription1", "account"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //什么意思
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuBarCell
        cell.imageView.image = UIImage(named: icons[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        //读取数组的照片名
        cell.backgroundColor = UIColor.rgb(red: 239, green: 32, blue: 31)
        return cell
    }
    
    override init(frame:CGRect) {
        
        super.init(frame: frame)
        
        collectionVIew.register(MenuBarCell.self, forCellWithReuseIdentifier: cellId)
        
        backgroundColor = UIColor.rgb(red: 239, green: 32, blue: 31)
        addSubview(collectionVIew)
        addconstraints(withVisualFormat: "H:|[v0]|", views: collectionVIew)
        addconstraints(withVisualFormat: "V:|[v0]|", views: collectionVIew)
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)//什么意思？
        collectionVIew.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .left)//默认运行软件时选择第一个"home"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuBarCell: BaseCell {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "home")
        iv.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)//渲染颜色
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }

    }
    
    override func setUpViews() {
        addSubview(imageView)
        addconstraints(withVisualFormat: "H:[v0(20)]", views: imageView)
        addconstraints(withVisualFormat: "V:[v0(20)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))

    }
}

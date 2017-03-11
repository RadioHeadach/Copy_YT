//
//  ViewController.swift
//  Copy_YT
//
//  Created by ROOSTERLIN on 2017/3/6.
//  Copyright © 2017年 ROOSTERLIN. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //navigationItem.title = "Home"
        
        //显示home
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-30, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        
        
        self.navigationController!.navigationBar.isTranslucent = false
        
        collectionView?.backgroundColor = UIColor.white
        //注册标识符,红色的方块
        collectionView?.register(YouTubeVideoCell.self, forCellWithReuseIdentifier: "homeCellId")
        
        //把collectionView向下移动50
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        //右侧滚动条往下移动50
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        setupNavBarButtons()
        setupMenuBar()
        
    }
    
    func setupNavBarButtons() {
        let searchImage = UIImage(named:"search1")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreButImage = UIImage(named:"more")?.withRenderingMode(.alwaysOriginal)
        let moreBarButtonItem = UIBarButtonItem(image: moreButImage, style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreBarButtonItem,searchBarButtonItem]
    }
    
    func handleSearch() {
        print("search")
    }
    
    func handleMore() {
        print("more")
    }

    //什么意思?
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    func setupMenuBar() {
        view.addSubview(menuBar)
        view.addconstraints(withVisualFormat: "H:|[v0]|", views: menuBar)
        view.addconstraints(withVisualFormat: "V:|[v0(50)]|", views: menuBar)
    }
    
    //返回cell的个数
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCellId", for: indexPath)
        
        //cell.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 20) * 9/16
        
        return CGSize(width:view.frame.width, height:height + 90)
    }
    
    //减少行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
}

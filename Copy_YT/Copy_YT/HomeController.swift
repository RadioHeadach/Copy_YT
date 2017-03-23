//
//  ViewController.swift
//  Copy_YT
//
//  Created by ROOSTERLIN on 2017/3/6.
//  Copyright © 2017年 ROOSTERLIN. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    var videos: [Video]?
    
    func fetchVideos() {
        
        //序列化
        let url = URL(string: "https://raw.githubusercontent.com/liuyandong/youtube/master/home.json")
        
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            

            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                //print(json)
                
                for dictionary in json as! [[String: AnyObject]]{
                    //print(dictionary["title"])
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.numberOfViews = dictionary["number_of_views"] as? NSNumber
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    
                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                    
                    let channel = Channel()
                    channel.name = channelDictionary["name"] as? String
                    channel.profileImageName = channelDictionary["profile_image_name"] as? String
                    video.channel = channel
                    
                    //输出测试
                    print("title:", dictionary["title"])
                    print("number_of_views:", dictionary["number_of_views"])
                    print("thumbnail_image_name:", dictionary["thumbnail_image_name"])
                    print("name:", dictionary["name"])
                    print("profile_image_name:", dictionary["profile_image_name"])

                    self.videos?.append(video)
                }
                
                
                    DispatchQueue.main.async {
                        self.collectionView?.reloadData()
                    }
                
            } catch let jsonError {
                print(jsonError)
            }
            }.resume()
    }
    
    //什么意思
//    var videos: [Video] = {
//    
//        var westlifeChannel = Channel()
//        westlifeChannel.name = "westlife"
//        westlifeChannel.profileImageName = "IMG_6631"
//        
//        var lizhiChannel = Channel()
//        lizhiChannel.name = "李志"
//        lizhiChannel.profileImageName = "jzm"
//
//        var easonChannel = Channel()
//        easonChannel.name = "EasonChan"
//        easonChannel.profileImageName = "Asher"
//
//        
//        var youRaiseMeUpVideo = Video()
//        youRaiseMeUpVideo.thumbnailImageName = "IMG_6565"
//        youRaiseMeUpVideo.title = "Sweet Child O' Mine - Postmodern Jukebox"
//        youRaiseMeUpVideo.channel = westlifeChannel
//        youRaiseMeUpVideo.numberOfViews = 23333333
//        
//        var reHeVideo = Video()
//        reHeVideo.thumbnailImageName = "landscape"
//        reHeVideo.title = "李志 - 热河"
//        reHeVideo.channel = lizhiChannel
//        reHeVideo.numberOfViews = 98888888
//        
//        var shanYinLuVideo = Video()
//        shanYinLuVideo.thumbnailImageName = "foggy"
//        shanYinLuVideo.title = "李志 - 山阴路的夏天"
//        shanYinLuVideo.channel = lizhiChannel
//        shanYinLuVideo.numberOfViews = 56666
//        
//        var easonVideo = Video()
//        easonVideo.thumbnailImageName = "godlike"
//        easonVideo.title = "陈奕迅 - 两名男子街头相遇"
//        easonVideo.channel = easonChannel
//        easonVideo.numberOfViews = 233333333333
//        
//        return [youRaiseMeUpVideo, reHeVideo, shanYinLuVideo, easonVideo]
//    
//    }()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //navigationItem.title = "Home"
        
        fetchVideos()
        
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
        view.addconstraints(withVisualFormat: "V:|[v0(50)]", views: menuBar)
    }
    
    //返回cell的个数
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return videos?.count ?? 0 //

        
//        if let count = videos?.count {
//            return count
//        }
//        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCellId", for: indexPath) as! YouTubeVideoCell
        
        cell.video = videos?[indexPath.item]
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

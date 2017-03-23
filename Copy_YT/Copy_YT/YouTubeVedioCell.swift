//
//  YouTubeVedioCell.swift
//  Copy_YT
//
//  Created by ROOSTERLIN on 2017/3/9.
//  Copyright © 2017年 ROOSTERLIN. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        
    }
    
    func setUpViews() {
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class YouTubeVideoCell: BaseCell {

    var video: Video? {
        didSet {
            titleLabel.text = video?.title
            
            setupThumbnailImage()
            
            //videoThumbnailView.image = UIImage(named: (video?.thumbnailImageName)!)
            
            //显示自定义头像
            if let profileImageName = video?.channel?.profileImageName {
                userImageView.image = UIImage(named: profileImageName)
            }
            
            if let channelName = video?.channel?.name, let numberOfViews = video?.numberOfViews {
                
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                //Specifies a decimal style format; for example, 12345678 is represented as “12,345,678”.
                
                subtitleTextView.text = "\(channelName) • \(formatter.string(from: numberOfViews)!) views"
            }
            
        }
    }
    //什么意思
    func setupThumbnailImage() {
        if let thumbnailUrl = video?.thumbnailImageName{
            let url = URL(string: thumbnailUrl)
            URLSession.shared.dataTask(with: url!, completionHandler:{(data, response, error) in
            
                if error != nil {
                    print(error)
                    return
                }
                
                
                //获取主线程
                DispatchQueue.main.async{
                    self.videoThumbnailView.image = UIImage(data: data!)
                }
            }).resume()
        }
        
    }
    
    //block
    let videoThumbnailView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        imageView.image = UIImage(named: "IMG_6565")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        //设置为false才可以布局
        return imageView
    }()
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "jzm")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let sepatatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 160, green: 160, blue: 160)
        return view
    }()//记得加括号
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sweet Child O' Mine - Postmodern Jukebox : Reboxed Cover ft. Casey Abrams"
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false//不让subtitle弹出文字输入框
        textView.text = "PostmodernJukebox • 2,555,552 views"
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.textColor = UIColor.rgb(red: 160, green: 160, blue: 160)
        return textView
    }()
    
    override func setUpViews() {
        
        addSubview(videoThumbnailView)//添加subView
        addSubview(sepatatorView)
        addSubview(userImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        //videoThumbnailView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        
        
        //使用visual format language进行布局，发现行与行之间的间隔大于20，用miniLineSpacing进行设置
        addconstraints(withVisualFormat: "H:|-10-[v0]-10-|", views: videoThumbnailView)
        addconstraints(withVisualFormat: "H:|-10-[v0(44)]", views: userImageView)
        //垂直方向
        addconstraints(withVisualFormat: "V:|-10-[v0]-8-[v1(44)]-16-[v2(1)]|", views: videoThumbnailView, userImageView,sepatatorView)
        addconstraints(withVisualFormat: "H:|[v0]|", views: sepatatorView)
        
        //是否可以使用sdAutoLayout
        //top
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: videoThumbnailView, attribute: .bottom, multiplier: 1, constant: 8))
        //left
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userImageView, attribute: .right, multiplier: 1, constant: 8))
        //right
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: videoThumbnailView, attribute: .right, multiplier: 1, constant: 0))
        //height
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: videoThumbnailView, attribute: .height, multiplier: 0, constant: 20))
        
        //------------
        
        //top
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
        //left
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userImageView, attribute: .right, multiplier: 1, constant: 8))
        //right
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: videoThumbnailView, attribute: .right, multiplier: 1, constant: 0))
        //height
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: videoThumbnailView, attribute: .height, multiplier: 0, constant: 20))
        
    }
    
    
}

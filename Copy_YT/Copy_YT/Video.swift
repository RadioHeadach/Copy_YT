//
//  Video.swift
//  Copy_YT
//
//  Created by ROOSTERLIN on 2017/3/12.
//  Copyright © 2017年 ROOSTERLIN. All rights reserved.
//

import UIKit

class Video: NSObject{
    var title: String?
    var thumbnailImageName: String?
    var numberOfViews: NSNumber?
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}


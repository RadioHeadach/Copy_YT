//
//  Extension.swift
//  Copy_YT
//
//  Created by ROOSTERLIN on 2017/3/7.
//  Copyright © 2017年 ROOSTERLIN. All rights reserved.
//

import UIKit

extension UIView {
    func addconstraints(withVisualFormat: String, views: UIView...) {
        var viewsDict = [String: UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            viewsDict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: withVisualFormat,
                                                      options: NSLayoutFormatOptions(),
                                                      metrics: nil,
                                                      views: viewsDict))
        
    }
}

//颜色
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/225, green: green/225, blue: blue/225, alpha: 1)
    }
}

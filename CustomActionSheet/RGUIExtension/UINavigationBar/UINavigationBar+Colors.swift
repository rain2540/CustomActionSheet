//
//  UINavigationBar+Colors.swift
//  RGUIExtension
//
//  Created by RAIN on 15/11/30.
//  Copyright © 2015年 Smartech. All rights reserved.
//

import UIKit

extension UINavigationBar {
    /**
     修改 Navigation Bar 的背景颜色
     
     - parameter color: 想要修改的颜色
     
     */
    static func barTintColor(color: UIColor) {
        UINavigationBar.appearance().barTintColor = color
    }
    
    /**
     修改 Navigation Bar 的主题颜色
     
     - parameter color: 想要修改的颜色
     
     */
    static func tintColor(color: UIColor) {
        UINavigationBar.appearance().tintColor = color
    }
    
    /**
     修改 Navigation Bar 的文字颜色
     
     - parameter color: 想要修改的颜色
     
     */
    static func titleTextColor(color: UIColor) {
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: color]
    }
}

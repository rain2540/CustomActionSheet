//
//  UIImage+URL.swift
//  RGUIExtension
//
//  Created by RAIN on 15/11/30.
//  Copyright © 2015年 Smartech. All rights reserved.
//

import UIKit

extension UIImage {
    /**
     通过URL路径获取Image
     
     - parameter contentsOfURL: 图片的 URL 地址
     */
    public convenience init?(contentsOfURL URLString: String) {
        guard let URL = NSURL(string: URLString) else {
            print("UIImage init Error: URL might not exist")
            return nil
        }
        
        guard let data = NSData(contentsOfURL: URL) else {
            print("UIImage init Error: get data fail")
            return nil
        }
        
        self.init(data: data)
    }
}

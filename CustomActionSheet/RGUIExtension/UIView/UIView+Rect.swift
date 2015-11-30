//
//  UIView+Rect.swift
//  RGUIExtension
//
//  Created by RAIN on 15/11/30.
//  Copyright © 2015年 Smartech. All rights reserved.
//

import UIKit

extension UIView {
    //  MARK: size
    /// size
    var size: CGSize { return self.bounds.size }
    
    /// width
    var width: CGFloat {
        get {
            return self.size.width
        }
        
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    /// height
    var height: CGFloat {
        get {
            return self.size.height
        }
        
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    //  MARK: origin
    /// x
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    /// y
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    /// right side x
    var maxX: CGFloat { return self.x + self.width }
    
    /// bottom y
    var maxY: CGFloat { return self.y + self.height }
    
    /// mid x
    var midX: CGFloat { return (self.x + self.maxX) / 2 }
    
    /// mid y
    var midY: CGFloat { return (self.y + self.maxY) / 2 }
}

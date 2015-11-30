//
//  UIView+DrawTools.swift
//  RGUIExtension
//
//  Created by RAIN on 15/11/30.
//  Copyright © 2015年 Smartech. All rights reserved.
//

import UIKit

public enum RGLineDirection {
    case Horizontal
    case Vertical
}

extension UIView {
    /// 为视图添加边线
    public func addBorder(width:CGFloat, cornerRadius:CGFloat, color:UIColor) {
        self.layer.masksToBounds = true
        self.layer.borderWidth = width
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = color.CGColor
    }
    
    /// 在 view 的指定位置加指定颜色的线
    public func drawLine(startPoint: CGPoint, length: CGFloat, width: CGFloat, color: UIColor, direction: RGLineDirection = .Horizontal) -> UIView {
        let line = UIView()
        line.backgroundColor = color
        
        switch (direction) {
        case .Horizontal:
            line.frame = CGRect(x: startPoint.x, y: startPoint.y, width: length, height: width)
            
        case .Vertical:
            line.frame = CGRect(x: startPoint.x, y: startPoint.y, width: width, height: length)
        }
        
        self.addSubview(line)
        
        return line
    }
}

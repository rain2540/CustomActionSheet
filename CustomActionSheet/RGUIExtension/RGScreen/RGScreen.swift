//
//  RGScreen.swift
//  RGUIExtension
//
//  Created by RAIN on 15/11/30.
//  Copyright © 2015年 Smartech. All rights reserved.
//

import UIKit

struct RGScreen {
    /// Screen.bounds
    static var bounds: CGRect { return self.suScreenC.bounds }
    
    /// Screen.size
    static var size: CGSize { return self.bounds.size }
    
    /// Screen.width
    static var width: CGFloat { return self.size.width }
    
    /// Screen.height
    static var height: CGFloat { return self.size.height }
    
    private static var opScreen: UIScreen?
    private static var suScreenC: UIScreen {
        if self.opScreen == nil {
            self.opScreen = UIScreen.mainScreen()
        }
        return self.opScreen!
    }
}

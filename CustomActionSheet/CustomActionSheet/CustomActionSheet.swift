//
//  CustomActionSheet.swift
//  CustomActionSheet
//
//  Created by RAIN on 15/11/30.
//  Copyright © 2015年 Smartech. All rights reserved.
//

import UIKit

private let intervalWithButtonsX: CGFloat = 30.0
private let intervalWithButtonsY: CGFloat = 5.0
private let buttonsPerRow = 3
private let headerHeight: CGFloat = 20.0
private let bottomHeight: CGFloat = 20.0
private let cancelButtonHeight: CGFloat = 46.0

@objc protocol CustomActionSheetDelegate {
    optional func choseAtIndex(index: Int)
}

class CustomActionSheet: UIView {
    weak var delegate: CustomActionSheetDelegate?
    
    lazy var backgroundImageView = UIImageView()
    lazy var cancelButton = UIButton()
    lazy var coverView = UIView()
    
    lazy var buttons = [UIButton]()
    
    /*init(buttonArray: [UIButton]) {
        self.buttons = buttonArray
        
        coverView = UIView(frame: UIScreen.mainScreen().bounds)
        coverView.backgroundColor =
        
    }*/
}

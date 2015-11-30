//
//  CustomActionSheet.swift
//  CustomActionSheet
//
//  Created by RAIN on 15/11/30.
//  Copyright © 2015年 Smartech. All rights reserved.
//

import UIKit

@objc protocol CustomActionSheetDelegate {
    optional func choseAtIndex(index: Int)
}

class CustomActionSheet: UIView {
    lazy var cancelButton = UIButton()
    lazy var coverView = UIView()
    
    lazy var buttons = [UIButton]()
    lazy var backgroundImageView = UIImageView()
    weak var delegate: CustomActionSheetDelegate?
}

//
//  CustomActionSheetButton.swift
//  CustomActionSheet
//
//  Created by RAIN on 15/11/30.
//  Copyright © 2015年 Smartech. All rights reserved.
//

import UIKit

class CustomActionSheetButton: UIView {
    var imageButton: UIButton!
    var titleLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let item = NSBundle.mainBundle().loadNibNamed("CustomActionSheetButton", owner: self, options: nil).first as! UIView
        for view in item.subviews {
            if view is UIButton {
                self.imageButton = view as! UIButton
            } else if view is UILabel {
                self.titleLabel = view as! UILabel
            }
        }
        
    }
    
    init() {
        super.init(coder: NSCoder())!
    }
    
    static func buttonWithImage(image: UIImage, title: String) -> CustomActionSheetButton? {
        if let button = NSBundle.mainBundle().loadNibNamed("CustomActionSheetButton", owner: self, options: nil).first as? CustomActionSheetButton {
            button.imageButton.setBackgroundImage(image, forState: .Normal)
            button.titleLabel.text = title
            return button
        }
        return nil
    }
}

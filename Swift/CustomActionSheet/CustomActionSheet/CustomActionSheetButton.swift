//
//  CustomActionSheetButton.swift
//  CustomActionSheet
//
//  Created by RAIN on 15/11/30.
//  Copyright © 2015年 Smartech. All rights reserved.
//

import UIKit

class CustomActionSheetButton: UIView {
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(coder: NSCoder())!
        let item = NSBundle.mainBundle().loadNibNamed("CustomActionSheetButton", owner: self, options: nil).first as! UIView
        for view in item.subviews {
            if view.isKindOfClass(UIButton.self) {
                self.imageButton = view as! UIButton
            } else if view.isKindOfClass(UILabel.self) {
                self.titleLabel = view as! UILabel
            }
        }
    }
    
    static func buttonWithImage(image: UIImage, title: String) -> CustomActionSheetButton {
        let button = CustomActionSheetButton()
        button.imageButton.setBackgroundImage(image, forState: .Normal)
        button.titleLabel.text = title
        return button
    }
}

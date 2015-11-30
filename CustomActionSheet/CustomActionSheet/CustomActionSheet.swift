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

@objc protocol CustomActionSheetDelegate: NSObjectProtocol {
    optional func choseAtIndex(index: Int)
}

class CustomActionSheet: UIView {
    weak var delegate: CustomActionSheetDelegate?
    
    lazy var backgroundImageView = UIImageView()
    lazy var cancelButton = UIButton()
    lazy var coverView = UIView()
    
    lazy var buttons = [UIView]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    init(buttonArray: [UIView]) {
        super.init(coder: NSCoder())!
        
        buttons = buttonArray
        backgroundColor = UIColor.grayColor()
        
        coverView = UIView(frame: RGScreen.bounds)
        coverView.backgroundColor = UIColor(Red: 51.0, Green: 51.0, Blue: 51.0, alpha: 0.6)
        coverView.hidden = true
        
        backgroundImageView = UIImageView(image: UIImage(named: "actionsheet_bg"))
        backgroundImageView.alpha = 0.7
        addSubview(backgroundImageView)
        
        for i in 0 ..< buttons.count {
            let button = self.buttons[i] as! CustomActionSheetButton
            button.imageButton.tag = i
            button.imageButton.addTarget(self, action: "buttonAction:", forControlEvents: .TouchUpInside)
            addSubview(button)
        }
        
        cancelButton = UIButton(type: .Custom)
        cancelButton.setBackgroundImage(UIImage(named: "actionsheet_button"), forState: .Normal)
        cancelButton.setTitle("取消", forState: .Normal)
        cancelButton.addTarget(self, action: "dissmiss", forControlEvents: .TouchUpInside)
        addSubview(cancelButton)
    }
    
    private func setPositionInView(view: UIView) {
        if buttons.count == 0 {
            return
        }
        
        
    }
    
    func showInView(view: UIView) {
        setPositionInView(view)
        view.addSubview(coverView)
        view.addSubview(self)
        UIView.beginAnimations("ShowCustomActionSheet", context: nil)
        frame = CGRect(x: 0, y: y - height, width: width, height: height)
        coverView.hidden = false
        UIView.commitAnimations()
    }
    
    func dismiss() {
        UIView.beginAnimations("DismissCustomActionSheet", context: nil)
        frame = CGRect(x: 0, y: y + height, width: width, height: height)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStopSelector("sheetDidDismissed")
        coverView.hidden = true
        UIView.commitAnimations()
    }
    
    func sheetDidDismissed() {
        coverView.removeFromSuperview()
        removeFromSuperview()
    }

    @objc private func buttonAction(sender: UIButton) {
        if (delegate?.respondsToSelector("choseAtIndex:")) != false {
            delegate?.choseAtIndex!(sender.tag)
        }
        dismiss()
    }
}

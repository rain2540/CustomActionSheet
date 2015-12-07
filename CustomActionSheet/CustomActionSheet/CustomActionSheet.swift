//
//  CustomActionSheet.swift
//  CustomActionSheet
//
//  Created by RAIN on 15/11/30.
//  Copyright © 2015年 Smartech. All rights reserved.
//

import UIKit

private let IntervalWithButtonsX: CGFloat = 30.0
private let IntervalWithButtonsY: CGFloat = 5.0
private let ButtonsPerRow = 3
private let HeaderHeight: CGFloat = 20.0
private let BottomHeight: CGFloat = 20.0
private let CancelButtonHeight: CGFloat = 46.0

@objc protocol CustomActionSheetDelegate: NSObjectProtocol {
//    func customActionSheetButtons(actionSheet: CustomActionSheet) -> [UIView]
    optional func customActionSheet(actionSheet: CustomActionSheet, choseAtIndex index: Int)
}

class CustomActionSheet: UIView {
    weak var delegate: CustomActionSheetDelegate?
    
    lazy var backgroundImageView = UIImageView()
    lazy var cancelButton = UIButton()
    lazy var coverView = UIView()
    
    var buttons: [UIView] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
//    convenience init(frame: CGRect, delegate: CustomActionSheetDelegate?) {
//        self.init(frame: frame)
//        
//        self.delegate = delegate
//    }
    
    func setupViews(buttonArray: [UIView]) {
        buttons = buttonArray//delegate?.customActionSheetButtons(self)
        backgroundColor = UIColor.grayColor()
        
        coverView = UIView(frame: MainScreen.bounds)
        coverView.backgroundColor = UIColor(Red: 51.0, Green: 51.0, Blue: 51.0, Alpha: 0.6)
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
        
        let buttonWidth = (buttons.first as! CustomActionSheetButton).width
        let buttonHeight = (buttons.first as! CustomActionSheetButton).height
        
        frame = CGRect(x: 0, y: view.height, width: view.width, height: CancelButtonHeight + BottomHeight + HeaderHeight + (buttonHeight + IntervalWithButtonsY) * (CGFloat(buttons.count - 1) / CGFloat(ButtonsPerRow + 1)))
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        let beginX = (width - (IntervalWithButtonsX * CGFloat(ButtonsPerRow - 1) + buttonWidth * CGFloat(ButtonsPerRow))) / 2
        cancelButton.frame = CGRect(x: beginX, y: (IntervalWithButtonsY + buttonHeight) * (CGFloat(buttons.count - 1) / CGFloat(ButtonsPerRow) + 1) + HeaderHeight, width: width - beginX * 2, height: CancelButtonHeight)
        
        if buttons.count > ButtonsPerRow {
            for i in 0 ..< buttons.count {
                let button = buttons[i] as! CustomActionSheetButton
                button.frame = CGRect(x: beginX + CGFloat(i % ButtonsPerRow) * (buttonWidth + IntervalWithButtonsX), y: HeaderHeight + CGFloat(i / ButtonsPerRow) * (buttonHeight + IntervalWithButtonsY), width: buttonWidth, height: buttonHeight)
            }
        } else {
            let intervalX = (width - beginX * 2 - buttonWidth * CGFloat(buttons.count)) / CGFloat(buttons.count - 1)
            for i in 0 ..< buttons.count {
                let button = buttons[i] as! CustomActionSheetButton
                button.frame = CGRect(x: beginX + CGFloat(i % ButtonsPerRow) * (buttonWidth + intervalX), y: HeaderHeight + CGFloat(i / ButtonsPerRow) * (buttonHeight + IntervalWithButtonsY), width: buttonWidth, height: buttonHeight)
            }
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
        if (delegate?.respondsToSelector("customActionSheet:choseAtIndex:")) != false {
            delegate?.customActionSheet!(self, choseAtIndex: sender.tag)
        }
        dismiss()
    }
}

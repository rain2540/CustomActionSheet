//
//  ViewController.swift
//  CustomActionSheet
//
//  Created by RAIN on 15/11/30.
//  Copyright © 2015年 Smartech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonAction() {
        let sheet = CustomActionSheet(frame: view.frame, delegate: self)

        sheet.showInView(view)
    }

}

extension ViewController: CustomActionSheetDelegate {
    func customActionSheetButtons(actionSheet: CustomActionSheet) -> [UIView] {
        return [CustomActionSheetButton.buttonWithImage(UIImage(named: "menu_add")!, title: "1"), CustomActionSheetButton.buttonWithImage(UIImage(named: "menu_add")!, title: "2"), CustomActionSheetButton.buttonWithImage(UIImage(named: "menu_add")!, title: "3"), CustomActionSheetButton.buttonWithImage(UIImage(named: "menu_add")!, title: "4")]
    }
}


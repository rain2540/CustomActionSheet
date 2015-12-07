//
//  CustomActionSheetButton.h
//  CustomActionSheet
//
//  Created by RAIN on 15/12/7.
//  Copyright © 2015年 Smartech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomActionSheetButton : UIView

@property (nonatomic, strong) UIButton * imageButton;
@property (nonatomic, strong) UILabel * titleLabel;

+ (CustomActionSheetButton *)buttonWithImage:(UIImage *)image title:(NSString *)title;

@end

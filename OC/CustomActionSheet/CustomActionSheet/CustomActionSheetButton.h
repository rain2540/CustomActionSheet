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

/**
 *  通过 image 和 title 构建 CustomActionSheetButton
 *
 *  @param image CustomActionSheetButton 上的图片
 *  @param title CustomActionSheetButton 上的标题
 *
 *  @return 新建的 CustomActionSheetButton
 */
+ (CustomActionSheetButton *)buttonWithImage:(UIImage *)image title:(NSString *)title;

@end

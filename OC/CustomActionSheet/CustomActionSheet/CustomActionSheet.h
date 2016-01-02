//
//  CustomActionSheet.h
//  CustomActionSheet
//
//  Created by RAIN on 15/12/7.
//  Copyright © 2015年 Smartech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomActionSheetButton.h"

@class CustomActionSheet;

#pragma mark CustomActionSheetDelegate
@protocol CustomActionSheetDelegate <NSObject>

@optional
/**
 *  按钮点击事件
 *
 *  @param actionSheet 本控件
 *  @param index       按钮索引值
 */
- (void)customActionSheet:(CustomActionSheet *)actionSheet
     clickedButtonAtIndex:(NSInteger)index;

/**
 *  点击取消按钮
 *
 *  @param actionSheet 本控件
 */
- (void)customActionSheetCancel:(CustomActionSheet *)actionSheet;

@end

#pragma mark -
@interface CustomActionSheet : UIView

@property (nonatomic, weak) id<CustomActionSheetDelegate> delegate;

/**
 *  通过载有 CustomActionSheetButton 的数组初始化 CustomActionSheet
 *
 *  @param buttons 载有 CustomActionSheetButton 的数组
 *
 *  @return CustomActionSheet对象
 */
- (instancetype)initWithButtons:(NSArray *)buttons;

/**
 *  在某个视图中显示 CustomActionSheet
 *
 *  @param view 显示 CustomActionSheet 的视图
 */
- (void)showInView:(UIView *)view;

@end

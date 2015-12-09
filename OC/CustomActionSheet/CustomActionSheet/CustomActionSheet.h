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

@protocol CustomActionSheetDelegate <NSObject>

@optional
- (void)customActionSheet:(CustomActionSheet *)actionSheet
     clickedButtonAtIndex:(NSInteger)index;

- (void)customActionSheetCancel:(CustomActionSheet *)actionSheet;


@end

@interface CustomActionSheet : UIView

@property (nonatomic, weak) id<CustomActionSheetDelegate> delegate;

- (instancetype)initWithButtons:(NSArray *)buttons;

/**
 *  在某个视图中显示 CustomActionSheet
 *
 *  @param view 显示 CustomActionSheet 的视图
 */
- (void)showInView:(UIView *)view;

@end

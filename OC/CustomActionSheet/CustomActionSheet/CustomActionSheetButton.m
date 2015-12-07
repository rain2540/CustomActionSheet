//
//  CustomActionSheetButton.m
//  CustomActionSheet
//
//  Created by RAIN on 15/12/7.
//  Copyright © 2015年 Smartech. All rights reserved.
//

#import "CustomActionSheetButton.h"

@implementation CustomActionSheetButton

#pragma mark Lifecycle
- (instancetype)init {
    if (self) {
        self = nil;
    }
    self = [[NSBundle mainBundle] loadNibNamed:@"CustomActionSheetButton" owner:self options:nil].firstObject;
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            self.imageButton = obj;
        } else if ([obj isKindOfClass:[UILabel class]]) {
            self.titleLabel = obj;
        }
    }
    return self;
}

- (void)dealloc {
    self.imageButton = nil;
    self.titleLabel = nil;
}

#pragma mark Create
+ (CustomActionSheetButton *)buttonWithImage:(UIImage *)image
                                       title:(NSString *)title
{
    CustomActionSheetButton * button = [[CustomActionSheetButton alloc] init];
    [button.imageButton setBackgroundImage:image forState:UIControlStateNormal];
    button.titleLabel.text = title;
    return button;
}

@end

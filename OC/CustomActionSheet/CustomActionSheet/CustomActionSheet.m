//
//  CustomActionSheet.m
//  CustomActionSheet
//
//  Created by RAIN on 15/12/7.
//  Copyright © 2015年 Smartech. All rights reserved.
//

#import "CustomActionSheet.h"

static CGFloat const IntervalWithButtonsX = 30.0f;
static CGFloat const IntervalWithButtonsY = 5.0f;
static NSInteger const ButtonsPerRow = 3;
static CGFloat const HeaderHeight = 20.0f;
static CGFloat const BottomHeight = 20.0f;
static CGFloat const CancelButtonHeight = 44.0f;

@interface CustomActionSheet ()

@property (nonatomic, strong) NSArray * buttons;

@property (nonatomic, strong) UIImageView * backgroundImageView;
@property (nonatomic, strong) UIView * coverView;
@property (nonatomic, strong) UIButton * cancelButton;

@end

@implementation CustomActionSheet

- (instancetype)initWithButtons:(NSArray *)buttons {
    self = [super init];
    self.buttons = buttons;
    if (self) {
        self.coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.coverView.backgroundColor = [UIColor colorWithRed:51.0f / 255.0f green:51.0f / 255.0f blue:51.0f / 255.0f alpha:0.6f];
        self.coverView.hidden = YES;
        
        self.backgroundImageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"actionsheet_bg"] stretchableImageWithLeftCapWidth:1 topCapHeight:110]];
        self.backgroundImageView.alpha = 0.7f;
        [self addSubview:self.backgroundImageView];
        
        for (NSInteger i = 0; i < self.buttons.count; i++) {
            CustomActionSheetButton * button = self.buttons[i];
            button.imageButton.tag = i;
            [button.imageButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelButton setBackgroundImage:[[UIImage imageNamed:@"actionsheet_button"] stretchableImageWithLeftCapWidth:19 topCapHeight:0] forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancelButton];
        
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)dealloc {
    self.buttons = nil;
    self.backgroundImageView = nil;
    self.coverView = nil;
    self.cancelButton = nil;
}

- (void)showInView:(UIView *)view {
    [self setPositionInView:view];
    [view addSubview:self.coverView];
    [view addSubview:self];
    [UIView beginAnimations:@"ShowCustomActionSheet" context:nil];
    self.frame = CGRectMake(0.0f, self.frame.origin.y - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    self.coverView.hidden = NO;
    [UIView commitAnimations];
}

- (void)dismiss {
    [UIView beginAnimations:@"DismissCustomActionSheet" context:nil];
    self.frame = CGRectMake(0.0f, self.frame.origin.y + self.frame.size.height, self.frame.size.width, self.frame.size.height);
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(sheetDidDismissed)];
    self.coverView.hidden = YES;
    [UIView commitAnimations];
}

- (void)setPositionInView:(UIView *)view {
    if (0 == self.buttons.count) {
        return;
    }
    CGFloat buttonWidth = ((CustomActionSheetButton *)self.buttons.firstObject).frame.size.width;
    CGFloat buttonHeight = ((CustomActionSheetButton *)self.buttons.firstObject).frame.size.height;
    self.frame = CGRectMake(0.0f, view.frame.size.height,
                            view.frame.size.width,
                            CancelButtonHeight + BottomHeight + HeaderHeight + (buttonHeight + IntervalWithButtonsY) * ((self.buttons.count - 1) / ButtonsPerRow + 1));
    self.backgroundImageView.frame = CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height);
    CGFloat beginX = (self.frame.size.width - (IntervalWithButtonsX * (ButtonsPerRow - 1) + buttonWidth * ButtonsPerRow)) / 2;
    self.cancelButton.frame = CGRectMake(beginX,
                                    (IntervalWithButtonsY + buttonHeight) * ((self.buttons.count - 1) / ButtonsPerRow + 1) + HeaderHeight,
                                    self.frame.size.width - beginX * 2,
                                         CancelButtonHeight);
    if (self.buttons.count > ButtonsPerRow) {
        for (int i = 0; i < [self.buttons count]; i++) {
            CustomActionSheetButton * button = [self.buttons objectAtIndex:i];
            button.frame = CGRectMake(beginX + i % ButtonsPerRow*(buttonWidth + IntervalWithButtonsX),
                                      HeaderHeight + i / ButtonsPerRow*(buttonHeight + IntervalWithButtonsY),
                                      buttonWidth, buttonHeight);
        }
    } else {
        CGFloat intervalX = (self.frame.size.width - beginX * 2 - buttonWidth * self.buttons.count) / (self.buttons.count - 1);
        for (int i = 0; i < [self.buttons count]; i++) {
            CustomActionSheetButton * button = self.buttons[i];
            button.frame = CGRectMake(beginX + i % ButtonsPerRow * (buttonWidth + intervalX),
                                      HeaderHeight + i / ButtonsPerRow*(buttonHeight + IntervalWithButtonsY), buttonWidth, buttonHeight);
        }
    }
}

- (void)buttonAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(customActionSheet:clickAtIndex:)]) {
        [self.delegate customActionSheet:self clickAtIndex:sender.tag];
    }
    [self dismiss];
}

- (void)sheetDidDismissed {
    [self.coverView removeFromSuperview];
    [self removeFromSuperview];
}

@end

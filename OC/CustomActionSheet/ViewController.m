//
//  ViewController.m
//  CustomActionSheet
//
//  Created by RAIN on 15/12/7.
//  Copyright © 2015年 Smartech. All rights reserved.
//

#import "ViewController.h"
#import "CustomActionSheet.h"

@interface ViewController () <CustomActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(UIButton *)sender {
    NSArray * buttonArray = @[[CustomActionSheetButton buttonWithImage:[UIImage imageNamed:@"menu_add"] title:@"1111"],
                              [CustomActionSheetButton buttonWithImage:[UIImage imageNamed:@"menu_add"] title:@"2222"],
                              [CustomActionSheetButton buttonWithImage:[UIImage imageNamed:@"menu_add"] title:@"3333"],
                              [CustomActionSheetButton buttonWithImage:[UIImage imageNamed:@"menu_add"] title:@"4444"],
                              [CustomActionSheetButton buttonWithImage:[UIImage imageNamed:@"menu_add"] title:@"5555"]];
    
    CustomActionSheet * sheet = [[CustomActionSheet alloc] initWithButtons:buttonArray];
    sheet.delegate = self;
    [sheet showInView:self.view];
}

#pragma mark - CustomActionSheetDelegate
- (void)customActionSheet:(CustomActionSheet *)actionSheet
     clickedButtonAtIndex:(NSInteger)index
{
    NSLog(@"%@", @(index));
}

- (void)customActionSheetCancel:(CustomActionSheet *)actionSheet {
    NSLog(@"only dismiss");
}

@end

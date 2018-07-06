//
//  LCNavigationController.m
//  LCThousandsMilesWalking
//
//  Created by 刘超 on 15/7/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "LCNavigationController.h"

@interface LCNavigationController ()

@end

@implementation LCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[[UIDevice currentDevice] systemVersion]doubleValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        [self.navigationBar setBarTintColor:[UIColor colorWithRed:1.0/255.0 green:197.0/255.0 blue:255.0/255.0 alpha:1.000]];
        [self.navigationBar setTintColor:[UIColor whiteColor]];
        self.navigationBar.translucent=NO;
        
        UIColor * cc = [UIColor whiteColor];
        NSDictionary * dict = [NSDictionary dictionaryWithObject:cc forKey:NSForegroundColorAttributeName];
        self.navigationBar.titleTextAttributes = dict;
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

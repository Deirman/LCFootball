//
//  LCTabBarController.m
//  LCThousandsMilesWalking
//
//  Created by 刘超 on 15/7/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "LCTabBarController.h"
#import "LCNavigationController.h"
#import "LCWorldCupViewController.h"
#import "LCRankingViewController.h"
#import "LCShooterListViewController.h"
#import "LCNewsViewController.h"



@interface LCTabBarController ()


@end

@implementation LCTabBarController

//调整字体的颜色
+ (void)initialize {
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#EE8B32"]} forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTabBarController];
}

- (void)createTabBarController {

    LCWorldCupViewController * worldCupViewController =(LCWorldCupViewController*)[self createViewControllerWith:@"LCWorldCupViewController" withTitle:@"世界杯" withNormalImg:@"icon-sjb" withSelectedImage:@"icon-sjb-selected"];
    LCNavigationController * WorldCupNav = [[LCNavigationController alloc] initWithRootViewController:worldCupViewController];

    LCRankingViewController * rankingViewController =(LCRankingViewController*)[self createViewControllerWith:@"LCRankingViewController" withTitle:@"积分榜" withNormalImg:@"icon-jfb" withSelectedImage:@"icon-jfb-selected"];
    LCNavigationController * rankingNav = [[LCNavigationController alloc] initWithRootViewController:rankingViewController];


    LCShooterListViewController *shooterListViewController =(LCShooterListViewController*)[self createViewControllerWith:@"LCShooterListViewController" withTitle:@"射手榜" withNormalImg:@"icon-ssb" withSelectedImage:@"icon-ssb-selected"];
    LCNavigationController *ShooterListNav = [[LCNavigationController alloc] initWithRootViewController:shooterListViewController];


    LCNewsViewController *newsViewController =(LCNewsViewController*)[self createViewControllerWith:@"LCNewsViewController" withTitle:@"新闻" withNormalImg:@"icon-xwb" withSelectedImage:@"icon-xw-selected"];
    LCNavigationController *newsNav = [[LCNavigationController alloc] initWithRootViewController:newsViewController];
    
    self.viewControllers =@[WorldCupNav,rankingNav,ShooterListNav,newsNav];
}

- (UIViewController *)createViewControllerWith:(NSString *)vcName withTitle:(NSString *)title withNormalImg:(NSString *)normalImage withSelectedImage:(NSString *)selectedImage {
    Class cls = NSClassFromString(vcName);
    UIViewController *vc = [[cls alloc] init];
    UIImage *norImg = [UIImage imageNamed:normalImage];
    UIImage *selImg = [UIImage imageNamed:selectedImage];
    //适配iOS7以后的版本
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
        norImg = [norImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        selImg = [selImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:norImg selectedImage:selImg];


    return vc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

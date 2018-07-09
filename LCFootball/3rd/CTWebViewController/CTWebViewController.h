//
//  CTWebViewController.h
//  CalledTaxi
//
//  Created by Peng on 2017/10/16.
//  Copyright © 2017年 YXZ. All rights reserved.
//



@interface CTWebViewController : UIViewController

@property(nonatomic, strong)NSString       *urlStr;         //地址
@property(nonatomic, strong)NSString       *titleStr;       //标题

@property(nonatomic, assign)BOOL           isWelcome;       //是否从欢迎界面进入

@end

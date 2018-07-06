//
//  LCTabBarController.h
//  LCThousandsMilesWalking
//
//  Created by 刘超 on 15/7/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCTabBarController : UITabBarController<UITabBarControllerDelegate>
@property(nonatomic,strong)UIButton* vehicleBtn;
-(void)setHidesVehicleBtn:(BOOL)isHide;

@end

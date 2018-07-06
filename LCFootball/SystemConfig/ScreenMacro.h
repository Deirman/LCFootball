//
//  ScreenMacro.h
//
//  Created by Peng on 2016/10/29.
//  Copyright ©  2016年 Peng. All rights reserved.
//

/*
 *  尺寸相关的宏定义
 */

#ifndef ScreenMacro_h
#define ScreenMacro_h

#define WinSize_Width  [[UIScreen mainScreen] bounds].size.width   //屏幕宽度
#define WinSize_Height [[UIScreen mainScreen] bounds].size.height  //屏幕高度

#define HwinScale [[UIScreen mainScreen] bounds].size.width/375    //iphone6缩放宽度比例
#define VwinScale [[UIScreen mainScreen] bounds].size.height/667   //iphone6缩放高度比例

#define Scale(s) HwinScale*s  //根据宽度比例缩放

#define NavgationBar_Height   (iPhoneX ? 88:64)
#define TabBar_Height         49

#define ItemViewControllerFrame CGRectMake(0, 0, WinSize_Width, WinSize_Height-TabBar_Height)

#define NavgationBar_Height   (iPhoneX ? 88:64)

#define   iPhoneX  CGSizeEqualToSize([[UIScreen mainScreen] bounds].size, CGSizeMake(375, 812))
#define   iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/// 弱引用
#define kWeakSelf __weak typeof(self) weakSelf = self
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define SS(strongSelf) __strong __typeof(&*weakSelf)strongSelf = weakSelf;

#endif

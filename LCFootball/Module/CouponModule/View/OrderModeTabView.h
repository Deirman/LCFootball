//
//  OrderModeTabView.h
//  
//
//  Created by isaced on 2017/8/23.
//
//

#import <UIKit/UIKit.h>

@protocol OrderModeTabViewDelegate;

/**
 叫单模式选项卡 View
 */
@interface OrderModeTabView : UIView

/**
 当前选择的 Tab 序号
 */
@property (nonatomic, assign) NSInteger selectedIndex;

/**
 代理接收事件回调
 */
@property (nonatomic, weak) id<OrderModeTabViewDelegate> delegate;

/**
 构造方法 （通过一组标题）
 */
- (instancetype)initWithItems:(NSArray<NSString *> *)items;
- (instancetype)initWithItems:(NSArray<NSString *> *)items delegate:(id<OrderModeTabViewDelegate>)delegate;

- (instancetype)initWithCustomItems:(NSArray<NSString *> *)items delegate:(id<OrderModeTabViewDelegate>)delegate;

/**
  模拟点击某一个
 */
-(void)didChoiceIndex:(NSInteger) index_num;


-(void)settempLabel:(NSString*)value selectedIndex:(NSInteger)selectedIndex;

 
@end

#pragma mark -

/**
 叫单模式选项卡 View 代理
 */
@protocol OrderModeTabViewDelegate <NSObject>

/**
 点击 Tab 回调
 */
- (void)orderModeTabView:(OrderModeTabView *)orderModeTabView didChangeTab:(NSInteger)tabIndex;

@end

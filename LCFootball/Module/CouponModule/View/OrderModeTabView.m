//
//  OrderModeTabView.m
//
//
//  Created by isaced on 2017/8/23.
//
//

#import "OrderModeTabView.h"
#import "Masonry.h"
#import "OrderModeTabArrowView.h"
#import "UIView+BlocksKit.h"

#define BUTTON_TAG_OFFSET 100
#define SubView_TAG_OFFSET 1000

@interface OrderModeTabView()

@property (nonatomic, readonly, copy) NSArray *items;

@property (nonatomic, strong) NSArray *tabButtons;

@property (nonatomic, strong) OrderModeTabArrowView *arrowView;

@property (nonatomic, assign) BOOL  flag;// 标记 是否 可点击 下一个

@end

@implementation OrderModeTabView

#pragma mark -

- (instancetype)initWithItems:(NSArray<NSString *> *)items {
    if (self = [super init]) {
        _items = items;
        NSAssert([items count] > 1, @"至少得有一个 item 吧");
        [self setupView];
    }
    return self;
}

- (instancetype)initWithItems:(NSArray<NSString *> *)items delegate:(id<OrderModeTabViewDelegate>)delegate{
    
    if (self = [super init]) {
        
        _flag=NO;
        _items = items;
        _delegate = delegate;
        NSAssert([items count] > 1, @"至少得有一个 item 吧");
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCustomItems:(NSArray<NSString *> *)items delegate:(id<OrderModeTabViewDelegate>)delegate{
    
    _flag=YES;
    
    if (self = [super init]) {
        // aa|bb  cc|dd
        _items = items;
        _delegate = delegate;
        NSAssert([items count] > 1, @"至少得有一个 item 吧");
        [self customView];
    }
    return self;
}

/**
 初始化视图
 */
- (void)customView {
    
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 38);
    self.backgroundColor =  [UIColor colorWithHexString:@"#FFFFFF"];

    // Buttons
    NSMutableArray *itemArray = [NSMutableArray array];
    
    for (int i = 0; i < [self.items count]; i++) {
        
        NSString *itemTitle = self.items[i];
        NSArray *tempSepArray=[itemTitle componentsSeparatedByString:@"|"];
        
        UIView *tempView=[UIView new];
        [tempView setBackgroundColor:[UIColor clearColor]];
        [tempView setTag:BUTTON_TAG_OFFSET + i];
     
        [self addSubview:tempView];
        
        for (int j = 0; j < [tempSepArray count]; j++ ) {
            
            NSString *subTitle =tempSepArray[j];
            UILabel *tempLabel=[self titleLabel:subTitle WithIndex:j];
            // 1000  1001
            tempLabel.tag=SubView_TAG_OFFSET*(i+1)+j;
            
            if (j==0) {
                [tempLabel setFrame:CGRectMake(0, 10, WinSize_Width/self.items.count, 18)];
            }
            else{
                [tempLabel setFrame:CGRectMake(0, 48, WinSize_Width/self.items.count, 14)];
                
            }
#pragma mark  to do  当前值只选第一个
             WS(weakSelf);
            [tempView  bk_whenTapped:^{
                [weakSelf viewAction:tempView];
            }];
            
            [tempView  addSubview:tempLabel];
        
        }
        [itemArray  addObject:tempView];
        self.tabButtons = itemArray;
    
    }
    // Arrow
    OrderModeTabArrowView *arrowView = [OrderModeTabArrowView defaultView];
    [self addSubview:arrowView];
    [arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.width.equalTo([self.tabButtons.firstObject mas_width]);
        make.height.offset(2);
    }];
    self.arrowView = arrowView;
    self.selectedIndex = 0;
    [self layoutViewsQueue:itemArray];
    [self setTempLabelForSelectedIndex:self.selectedIndex];
 
    
}
/**
 初始化视图
 */
- (void)setupView {
    
    self.frame = CGRectMake(0, NavgationBar_Height, [UIScreen mainScreen].bounds.size.width, 70);
    self.backgroundColor = [UIColor colorWithHexString:@"#1B1B1B"];

    
    // Buttons
    NSMutableArray *buttons = [NSMutableArray array];
    for (int i = 0; i < [self.items count]; i++) {
        NSString *itemTitle = self.items[i];
        
        UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [itemButton setTitle:itemTitle forState:UIControlStateNormal];
        [itemButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [itemButton setBackgroundColor:[UIColor clearColor]];
        [itemButton setTag:BUTTON_TAG_OFFSET + i];
        [itemButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:itemButton];
        [buttons addObject:itemButton];
    }
    [self layoutViewsQueue:buttons];
    self.tabButtons = buttons;
    
    // Arrow
    OrderModeTabArrowView *arrowView = [OrderModeTabArrowView defaultView];
    [self addSubview:arrowView];
    [arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.width.equalTo([buttons.firstObject mas_width]);
        make.height.offset(2);
    }];
    self.arrowView = arrowView;
    self.selectedIndex = 0;
    [self setTempLabelForSelectedIndex:self.selectedIndex];
}


#pragma mark  自定义 label

-(UILabel *)titleLabel:(NSString *)text WithIndex:(int )index{
    
    UILabel *_draftLabel = [[UILabel alloc] init];
    
    if (index==0) {

        _draftLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        // 43 198 75
        _draftLabel.font =[UIFont systemFontOfSize:16];
        _draftLabel.textAlignment=NSTextAlignmentCenter;
        _draftLabel.text=text;
    }
    else{
        
//        _draftLabel.textColor = [UIColor colorWithHexString:@"#666666"];
//        // 43 198 75
//        _draftLabel.font =[UIFont systemFontOfSize:14];
//        _draftLabel.textAlignment=NSTextAlignmentCenter;
//        _draftLabel.text=text;
    }
    
    return  _draftLabel;
    
}

/**
 Tab 按钮并列排版布局（Masonry）
 */
- (void)layoutViewsQueue:(NSArray<UIView *> *)views {
    
    for (int i = 0; i < [views count]; i++) {
        UIView *view = views[i];
        UIView *prevView = (i != 0) ? views[i-1] : nil;
        UIView *nextView = (i < [views count] - 1) ? views[i+1] : nil;
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(@0);
            
            // first
            if (i == 0) {
                make.left.equalTo(@0);
            }else if (prevView) {
                make.left.equalTo(prevView.mas_right);
            }
            
            if (nextView) {
                make.width.equalTo(nextView.mas_width);
            }
            
            if (prevView) {
                make.width.equalTo(prevView.mas_width);
            }
            
            // last
            if (i == [views count]-1) {
                make.right.equalTo(@0);
            }
        }];
    }

}

- (void)moveArrowToTabIndex:(NSInteger)tabIndex animation:(BOOL)animation {
    
  
    
    UIButton *button = self.tabButtons[tabIndex];
    
#pragma mark  to do lqh77
    
//    if(_flag&&tabIndex==1){
//        return ;
//    }
    
    void (^layout)(void) = ^{
        [self.arrowView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom);
            make.centerX.equalTo(button.mas_centerX);
            make.width.equalTo([button mas_width]);
        }];
    };
    if (animation) {
        [UIView animateWithDuration:0.18 delay:0 usingSpringWithDamping:1 initialSpringVelocity:15 options:UIViewAnimationOptionCurveEaseOut animations:^{
            layout();
            [self layoutIfNeeded];
        } completion:nil];
    }else{
        layout();
    }
}

#pragma mark -

/**
 Tab 按钮统一回调
 */
- (void)buttonAction:(UIButton *)button {

    NSInteger buttonIndex = button.tag - BUTTON_TAG_OFFSET;
    if (self.selectedIndex != buttonIndex) {
        self.selectedIndex = buttonIndex;
        [self moveArrowToTabIndex:buttonIndex animation:YES];
        if ([self.delegate respondsToSelector:@selector(orderModeTabView:didChangeTab:)]) {
            [self.delegate orderModeTabView:self didChangeTab:buttonIndex];
        }
    }
}


/**
 Tab view统一回调
 */
- (void)viewAction:(UIView *)button {
    
    NSInteger buttonIndex = button.tag - BUTTON_TAG_OFFSET;
    if (self.selectedIndex != buttonIndex) {
        self.selectedIndex = buttonIndex;
        [self setTempLabelForSelectedIndex:self.selectedIndex];
        [self moveArrowToTabIndex:buttonIndex animation:YES];
        if ([self.delegate respondsToSelector:@selector(orderModeTabView:didChangeTab:)]) {
            [self.delegate orderModeTabView:self didChangeTab:buttonIndex];
        }
    }
}

-(void)setTempLabelForSelectedIndex:(NSInteger)selectedIndex{
    for (int i = 0; i < [self.items count]; i++) {
        
        NSString *itemTitle = self.items[i];
        NSArray *tempSepArray=[itemTitle componentsSeparatedByString:@"|"];
        
        UIView *tempView=[UIView new];
        [tempView setBackgroundColor:[UIColor clearColor]];
        [tempView setTag:BUTTON_TAG_OFFSET + i];
        
        [self addSubview:tempView];
        
        for (int j = 0; j < [tempSepArray count]; j++ ) {
            
            NSInteger  tempLabelTag = SubView_TAG_OFFSET*(i+1)+j;
            UILabel * tempLabel = [self viewWithTag:tempLabelTag];
            
            if (i == selectedIndex) {
                [tempLabel setTextColor: [UIColor colorWithHexString:@"#FF8401"]];
            }else{
                [tempLabel setTextColor:[UIColor colorWithHexString:@"#666666"]];
            }
        }
    }
}

-(void)settempLabel:(NSString*)value selectedIndex:(NSInteger)selectedIndex{
    
    NSInteger  tempLabelTag = SubView_TAG_OFFSET*(selectedIndex+1);
    UILabel * tempLabel = [self viewWithTag:tempLabelTag];
    [tempLabel setText:value];
}



/**
 模拟点击某一个
 
 */
-(void)didChoiceIndex:(NSInteger)index_num{
    
    
    if (self.selectedIndex != index_num) {
        self.selectedIndex = index_num;
        
        [self moveArrowToTabIndex:index_num animation:YES];
        
        if ([self.delegate respondsToSelector:@selector(orderModeTabView:didChangeTab:)]) {
            [self.delegate orderModeTabView:self didChangeTab:index_num];
        }
    }}


@end

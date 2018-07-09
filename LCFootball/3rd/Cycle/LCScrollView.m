//
//  LCScrollView.m
//  CalledTaxi
//
//  Created by Deirman on 2018/3/15.
//  Copyright © 2018年 YXZ. All rights reserved.
//

#import "LCScrollView.h"

@implementation LCScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.delaysContentTouches = NO;
    }
    return self;
}


- (BOOL) touchesShouldCancelInContentView : (UIView *) view {
    if ([view isKindOfClass:[UIButton class]]) {
        return YES;
    }
    return [super touchesShouldCancelInContentView:view];
}

@end

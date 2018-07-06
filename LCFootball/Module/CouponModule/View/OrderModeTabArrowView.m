//
//  OrderModeTabArrowView.m
//  ocdemo
//
//  Created by isaced on 2017/8/23.
//
//

#import "OrderModeTabArrowView.h"

#define defaultSize CGSizeMake(17, 2)

@implementation OrderModeTabArrowView

+ (instancetype)defaultView {
    OrderModeTabArrowView *v = [[self alloc] initWithFrame:CGRectMake(0, NavgationBar_Height,100, defaultSize.height)];
    v.backgroundColor = [UIColor colorWithHexString:@"#FF8401"];


    return v;
}

- (CGSize)intrinsicContentSize {
    return defaultSize;
}

- (void)drawRect:(CGRect)rect {
    // Color Declarations


//    CGContextRef ref = UIGraphicsGetCurrentContext();
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(rect.size.width/2 - 7, rect.size.height)];
//    [path addLineToPoint:CGPointMake(rect.size.width/2,rect.size.height/2)];
//    [path addLineToPoint:CGPointMake(rect.size.width/2 + 7, rect.size.height)];
//    [path closePath];
//    CGContextSetFillColorWithColor(ref, [UIColor whiteColor].CGColor);
//    [path fill];


}


@end

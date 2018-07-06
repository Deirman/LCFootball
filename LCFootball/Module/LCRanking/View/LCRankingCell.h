//
//  LCRankingCell.h
//  LCFootball
//
//  Created by Deirman on 2018/7/6.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCRankingCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *numberLable;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@end

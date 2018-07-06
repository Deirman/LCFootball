//
//  LCRankingViewController.m
//  LCFootball
//
//  Created by Deirman on 2018/7/5.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "LCRankingViewController.h"
#import "OrderModeTabView.h"
#import "LCRankingCell.h"

@interface LCRankingViewController ()<OrderModeTabViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) OrderModeTabView * orderModeTabView;

@property (nonatomic,strong) UITableView * myTableView;
@property (nonatomic,strong) NSArray * nameArray;
@property (nonatomic,strong) NSArray * scoreArray;

@end

@implementation LCRankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
    // Do any additional setup after loading the view.
}

-(void)initViews{
    NSString * item0 =[NSString stringWithFormat:@"%@|%@",@"世界杯",nil];
    NSString * item1 =[NSString stringWithFormat:@"%@|%@",@"中超",nil];
    NSString * item2 =[NSString stringWithFormat:@"%@|%@",@"英超",nil];
    NSString * item3 =[NSString stringWithFormat:@"%@|%@",@"西甲",nil];
    NSString * item4 =[NSString stringWithFormat:@"%@|%@",@"徳甲",nil];
    NSString * item5 =[NSString stringWithFormat:@"%@|%@",@"意甲",nil];
    self.orderModeTabView= [[OrderModeTabView alloc] initWithCustomItems:@[item0,item1,item2,item3,item4,item5] delegate:self];
    self.orderModeTabView.delegate = self;
    [self.view addSubview:self.orderModeTabView];
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"#F6F6F6"]];


    [self.view addSubview:self.myTableView];

    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.orderModeTabView.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
    self.nameArray =@[@"曼城",@"曼联",@"热刺",@"利物浦",@"切尔西",@"阿森纳",@"伯恩利"];
    self.scoreArray =@[@"100",@"81",@"77",@"75",@"70",@"63",@"54"];


}
-(UITableView *)myTableView{
    if (_myTableView == nil) {
        _myTableView = [[UITableView alloc] init];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.layer.cornerRadius = 10;
        _myTableView.layer.masksToBounds=YES;

    }
    return _myTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_nameArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"LCRankingCell";
    LCRankingCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    if(cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"LCRankingCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];

    }
    if (indexPath.row == 0) {
        cell.numberLable.hidden =YES;
        [cell.iconImageView setImage:[UIImage imageNamed:@"jp"]];
        [cell.scoreLabel setTextColor:[UIColor colorWithHexString:@"#E83227"]];



    }else if (indexPath.row == 1){
        cell.numberLable.hidden =YES;
        [cell.iconImageView setImage:[UIImage imageNamed:@"tp"]];
        [cell.scoreLabel setTextColor:[UIColor colorWithHexString:@"#E83227"]];

    }else if (indexPath.row == 2){
        cell.numberLable.hidden =YES;
        [cell.iconImageView setImage:[UIImage imageNamed:@"yp"]];
        [cell.scoreLabel setTextColor:[UIColor colorWithHexString:@"#E83227"]];

    }else{
        cell.iconImageView.hidden =YES;
        [cell.numberLable setText:[NSString stringWithFormat:@"%ld",indexPath.row]];
        [cell.scoreLabel setTextColor:[UIColor colorWithHexString:@"#009933"]];

    }
    [cell.nameLable setText:[self.nameArray objectAtIndex:indexPath.row]];
    [cell.scoreLabel setText:[self.scoreArray objectAtIndex:indexPath.row]];
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 70;//这里取字典里面的值时是0,请问我要怎么改
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

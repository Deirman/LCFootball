//
//  LCNewsViewController.m
//  LCFootball
//
//  Created by Deirman on 2018/7/5.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "LCNewsViewController.h"
#import "OrderModeTabView.h"
#import "YHLoopScrollView.h"
#import "CycleImageView.h"
#import "LCCNewTableViewCell.h"
#import "CTWebViewController.h"

@interface LCNewsViewController ()<OrderModeTabViewDelegate,YHLoopScrollViewDelegate,CycleImageViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) OrderModeTabView * orderModeTabView;
@property (nonatomic,strong) UITableView * myTableView;

@end

@implementation LCNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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

    
    CycleImageView *cycleImageView = [[CycleImageView alloc]initWithFrame:CGRectMake(0,self.orderModeTabView.frame.size.height+self.orderModeTabView.frame.origin.y, WinSize_Width, 150)];
    cycleImageView.images = @[[UIImage imageNamed:@"xw-bg"],[UIImage imageNamed:@"xw-bg2"],[UIImage imageNamed:@"xw-bg3"]];
    cycleImageView.delegate = self;

    [self.view addSubview:cycleImageView];

    [self.view addSubview:self.myTableView];
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cycleImageView.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)orderModeTabView:(OrderModeTabView *)orderModeTabView didChangeTab:(NSInteger)tabIndex{

}

- (void)didSelectItemAtIndex:(NSInteger)index{

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
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"LCCNewTableViewCell";
    LCCNewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    if(cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"LCCNewTableViewCell" owner:self options:nil];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell = [nib objectAtIndex:0];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

    }
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 100;//这里取字典里面的值时是0,请问我要怎么改
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    CTWebViewController *webVC = [[CTWebViewController alloc] init];
    webVC.titleStr  = @"新闻详情";

    webVC.urlStr   = @"https://baike.baidu.com/item/2018年俄罗斯世界杯/10120749";
    [self.navigationController pushViewController:webVC animated:YES];

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

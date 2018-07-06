//
//  LCWorldCupViewController.m
//  LCFootball
//
//  Created by Deirman on 2018/7/5.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "LCWorldCupViewController.h"
#import "OrderModeTabView.h"
#import "LCWorldCupCell.h"

@interface LCWorldCupViewController ()<OrderModeTabViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) OrderModeTabView * orderModeTabView;
@property (nonatomic,strong) UILabel * timeLable;
@property (nonatomic,strong) UITableView * myTableView;

@end

@implementation LCWorldCupViewController

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

    [self.view addSubview:self.timeLable];
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.orderModeTabView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.offset(Scale(30));
    }];

    [self.view addSubview:self.myTableView];

    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.timeLable.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];


}

-(UILabel *)timeLable{
    if (_timeLable == nil) {
        _timeLable = [[UILabel alloc] init];
        [_timeLable setText:@"2018-07-17  昨天"];
        [_timeLable setTextAlignment:NSTextAlignmentCenter];
        [_timeLable setTextColor:[UIColor colorWithHexString:@"#000000"]];
        [_timeLable setFont:[UIFont systemFontOfSize:13]];

    }
    return _timeLable;
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
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"LCWorldCupCell";
    LCWorldCupCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    if(cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"LCWorldCupCell" owner:self options:nil];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell = [nib objectAtIndex:0];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

    }
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 95;//这里取字典里面的值时是0,请问我要怎么改
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

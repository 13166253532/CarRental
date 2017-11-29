//
//  ViewController.m
//  SQlDemo
//
//  Created by xiejiangbo on 2017/11/20.
//  Copyright © 2017年 yin chen. All rights reserved.
//

#import "ViewController.h"
#import "DSHttpMessageListCmd.h"
#import "DSHttpMessageListResult.h"

typedef void (^HttpBlock)(RequestResult *result,id *userInfor);


@interface ViewController (){
    HttpBlock block;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.backgroundColor = [UIColor yellowColor];
    label.text = NSLocalizedString(@"TOTLE", @"大");
    [self.view addSubview:label];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self httpScreenParkCityListRequire];
}

-(void)httpScreenParkCityListRequire{
    HttpCommand *cmd = [DSHttpMessageListCmd httpCommandWithVersion:PHttpVersion_v1];
    typeof(self) __weak weakSelf = self;
    SMBaseHttpComplete *completeDelegate = [[SMBaseHttpComplete alloc]initWithBlock:^(RequestResult *result, id userInfo) {
        [weakSelf httpScreenParkCityListResponse:result];
    } withUserInfo:nil] ;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"1" forKey:kHttpParamKey_FollowCountNum_role];
    cmd.requestInfo = dic;
    cmd.completeDelegate = completeDelegate;
    [cmd execute];

}
-(void)httpScreenParkCityListResponse:(RequestResult *)result{
    DSHttpMessageListResult *r = result;
    if ([r isOk]) {
        NSMutableArray *array = [r getTheAllData];
        
    }else{
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


























@end

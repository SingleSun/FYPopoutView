//
//  ViewController.m
//  FYPopView
//
//  Created by 樊杨 on 2017/6/13.
//  Copyright © 2017年 YHCRT.FY. All rights reserved.
//

#import "ViewController.h"
#import "PopView.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * popButton = [UIButton buttonWithType:UIButtonTypeCustom];
    popButton.frame = CGRectMake(self.view.bounds.size.width/2.0-50, 100, 100, 40);
    popButton.backgroundColor = [UIColor cyanColor];
    [popButton setTitle:@"popView" forState:UIControlStateNormal];
    [popButton addTarget:self action:@selector(popButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [popButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:popButton];
}

-(void)popButtonClick:(UIButton *)button{
    PopView * pv = [[PopView alloc]initWithFrame:CGRectMake(kScreenWidth/2.0-70, kScreenHeight/2.0-50, 150, 100)];
    pv.textImage = [UIImage imageNamed:@"correct"];
    pv.text = @"签到成功，+5分！";
    [pv showAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

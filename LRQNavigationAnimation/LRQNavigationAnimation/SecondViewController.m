//
//  SecondViewController.m
//  LRQNavigationAnimation
//
//  Created by lirenqiang on 16/7/23.
//  Copyright © 2016年 lirenqiang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController {
    UIButton * _popBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.orangeColor;
    
    [self prepareForPopBtn];
}

- (void)prepareForPopBtn {
    _popBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.center.x-30, self.view.center.y-30, 60, 60)];
    
    [_popBtn setTitle:@"POP" forState:UIControlStateNormal];
    [_popBtn addTarget:self action:@selector(popBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_popBtn];
}

- (void)popBtnAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

@end

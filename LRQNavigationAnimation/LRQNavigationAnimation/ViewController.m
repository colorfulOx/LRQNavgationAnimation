//
//  ViewController.m
//  LRQNavigationAnimation
//
//  Created by lirenqiang on 16/7/23.
//  Copyright © 2016年 lirenqiang. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "LRQNavTransition.h"

@interface ViewController () <UINavigationControllerDelegate>
@property (nonatomic, strong) LRQNavTransition * navTransition;
@end

@implementation ViewController {
    UIButton * _pushBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.greenColor;
    self.navigationController.delegate = self;
    
    [self prepareForPushBtn];
}

- (void)prepareForPushBtn {
    _pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.center.x-30, self.view.center.y-30, 60, 60)];
    [_pushBtn setTitle:@"PUSH" forState:UIControlStateNormal];
    [_pushBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [_pushBtn addTarget:self action:@selector(pushBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_pushBtn];
}

- (void)pushBtnAction {
    SecondViewController * svc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController 
                                  animationControllerForOperation:(UINavigationControllerOperation)operation 
                                               fromViewController:(UIViewController *)fromVC 
                                                 toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPush) {
        self.navTransition.navState = LRQNavigationStatePush;
    } else {
        self.navTransition.navState = LRQNavigationStatePop;
    }
    return self.navTransition;
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

- (LRQNavTransition *)navTransition {
    if (!_navTransition) {
        _navTransition = [[LRQNavTransition alloc] init];
    }
    return _navTransition;
}

@end

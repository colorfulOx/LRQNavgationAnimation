//
//  LRQNavTransition.m
//  LRQNavigationAnimation
//
//  Created by lirenqiang on 16/7/23.
//  Copyright © 2016年 lirenqiang. All rights reserved.
//

#import "LRQNavTransition.h"

@implementation LRQNavTransition
/// 返回过渡动画的时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController * fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect bounds = toVc.view.frame;
    
    switch (self.navState) {
        case LRQNavigationStatePush:
            toVc.view.frame = CGRectOffset(bounds, 0, bounds.size.height);
            break;
        case LRQNavigationStatePop:
            toVc.view.frame = CGRectOffset(bounds, 0, -bounds.size.height);
            
        default:
            break;
    }
    
    [[transitionContext containerView] addSubview:toVc.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] 
                          delay:0.0 
         usingSpringWithDamping:0.5 
          initialSpringVelocity:0.0 
                        options:UIViewAnimationOptionCurveEaseIn 
                     animations:^{
                         
                         fromVc.view.alpha = 0.8;
                         toVc.view.frame = bounds;
                         
                     } 
                     completion:^(BOOL finished) {
                         
                         fromVc.view.alpha = 1.0;
                         
                         [transitionContext completeTransition:YES];
                     }];
    
}

@end

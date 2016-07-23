//
//  LRQNavTransition.h
//  LRQNavigationAnimation
//
//  Created by lirenqiang on 16/7/23.
//  Copyright © 2016年 lirenqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LRQNavigationState) {
    LRQNavigationStatePush,
    LRQNavigationStatePop,
};

@interface LRQNavTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) LRQNavigationState navState;

@end

//
//  TransitionDelegate.m
//  WaterWell
//
//  Created by Amira Elmansy on 1/20/15.
//  Copyright (c) 2015 MeroCode. All rights reserved.
//

#import "TransitionDelegate.h"
#import "AnimatedTransition.h"

@interface TransitionDelegate ()

@property (nonatomic, strong) AnimatedTransition *controller;

@end

@implementation TransitionDelegate

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.controller = [[AnimatedTransition alloc] init];
    self.controller.isPresenting = YES;
    return self.controller;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.controller.isPresenting = NO;
    return self.controller;
}

@end

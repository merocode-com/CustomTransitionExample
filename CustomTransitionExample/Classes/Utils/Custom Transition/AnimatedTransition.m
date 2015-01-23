//
//  AnimatedTransition.m
//  WaterWell
//
//  Created by Amira Elmansy on 1/20/15.
//  Copyright (c) 2015 MeroCode. All rights reserved.
//

#import "AnimatedTransition.h"
#import "MenuViewController.h"
#import "HomeViewController.h"

@implementation AnimatedTransition

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (self.isPresenting == YES)
    {
        [self executePresentingAnimation:transitionContext];
    }
    else
    {
        [self executeDismissalAnimation:transitionContext];
    }
}

#pragma mark - Custom methods

- (void) executePresentingAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    
    MenuViewController *toVC = (MenuViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [containerView addSubview:toVC.view];
    
    toVC.contentViewLeadingConstraint.constant = -1 * toVC.view.frame.size.width;
    [toVC.view layoutIfNeeded];
    
    __weak MenuViewController *weakToVC = toVC;
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        weakToVC.contentViewLeadingConstraint.constant = 0;
        [weakToVC.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void) executeDismissalAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    MenuViewController *fromVC = (MenuViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    __weak MenuViewController *weakFromVC = fromVC;
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        weakFromVC.contentViewLeadingConstraint.constant = -1 * weakFromVC.view.frame.size.width;
        [weakFromVC.view layoutIfNeeded];

    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        [fromVC.view removeFromSuperview];
    }];
}


@end

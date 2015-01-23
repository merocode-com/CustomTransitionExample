//
//  AnimatedTransition.h
//  WaterWell
//
//  Created by Amira Elmansy on 1/20/15.
//  Copyright (c) 2015 MeroCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AnimatedTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL isPresenting;

@end

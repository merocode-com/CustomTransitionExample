//
//  HomeViewController.m
//  CustomTransitionExample
//
//  Created by Amira Elmansy on 1/20/15.
//  Copyright (c) 2015 MeroCode. All rights reserved.
//

#import "HomeViewController.h"
#import "MenuViewController.h"
#import "TransitionDelegate.h"

@interface HomeViewController ()

@property (nonatomic, strong) TransitionDelegate *transitionController;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.transitionController = [[TransitionDelegate alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)showMenu:(id)sender {
    
    MenuViewController *menuVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    menuVC.modalPresentationStyle = UIModalPresentationCustom;
    menuVC.transitioningDelegate = self.transitionController;
    [self presentViewController:menuVC animated:self completion:nil];
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

//
//  ViewController.m
//  CJOrientationTransitionDemo
//
//  Created by fminor on 2018/8/26.
//  Copyright © 2018 fminor. All rights reserved.
//

#import "CJVerticalViewController.h"

@interface CJVerticalViewController ()

@end

@implementation CJVerticalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [CJOrientationManager sharedManager].supportedOrientationMask = UIInterfaceOrientationMaskPortrait;
    [[CJOrientationManager sharedManager] changeDeviceOrientationToPortrait];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (IBAction)unwindSegue:(UIStoryboardSegue *)sender{
    NSLog(@"unwindSegue %@", sender);
}

@end

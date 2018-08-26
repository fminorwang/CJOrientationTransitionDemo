//
//  CJHorizontalViewController.m
//  CJOrientationTransitionDemo
//
//  Created by fminor on 2018/8/26.
//  Copyright © 2018 fminor. All rights reserved.
//

#import "CJHorizontalViewController.h"

@interface CJHorizontalViewController () <UINavigationControllerDelegate>
{
    UIImage *_screenShot;
}

@end

@implementation CJHorizontalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CJOrientationManager.sharedManager.supportedOrientationMask = UIInterfaceOrientationMaskLandscape;
    [CJOrientationManager.sharedManager changeDeviceOrientationToLandscape];
    
    self.navigationController.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 在切换横竖屏前关闭动画
    [UIView setAnimationsEnabled:NO];
    
    [CJOrientationManager sharedManager].supportedOrientationMask = UIInterfaceOrientationMaskPortrait;
    [[CJOrientationManager sharedManager] changeDeviceOrientationToPortrait];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    _screenShot = [UIImage imageWithView:self.view];
    if ( operation == UINavigationControllerOperationPop ) {
        CJOrientationTransition *_transition = [[CJOrientationTransition alloc] init];
        _transition.operation = operation;
        _transition.orientation = UIDevice.currentDevice.orientation;
        _transition.screenShot = _screenShot;
        return _transition;
    }
    return nil;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

@end

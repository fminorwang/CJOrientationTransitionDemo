//
//  CJOrientationTransition.m
//  CJOrientationTransitionDemo
//
//  Created by fminor on 2018/8/26.
//  Copyright © 2018 fminor. All rights reserved.
//

#import "CJOrientationTransition.h"

#define _ANIM_DURATION_ 0.5

@implementation CJOrientationTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return _ANIM_DURATION_;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    CGFloat _screen_width = MIN(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    CGFloat _screen_height = MAX(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [transitionContext containerView].backgroundColor = [UIColor blackColor];
    
    [UIView setAnimationsEnabled:YES];
    
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    CGRect fromStartFrame = [transitionContext finalFrameForViewController:toViewController];
    fromViewController.view.frame = fromStartFrame;
    
    toViewController.view.frame = CGRectMake(0, 0, _screen_width, _screen_height);
    
    UIImageView *screenShotView = [[UIImageView alloc] initWithImage:self.screenShot];
    screenShotView.frame = CGRectMake(0, 0, _screen_height, _screen_width);
    screenShotView.center = toViewController.view.center;
    CGFloat _angle = M_PI / 2.f;
    
    if ( self.orientation == UIDeviceOrientationLandscapeRight ) { // 水平方向有两种，截图可能要旋转 180 度
        _angle = -M_PI / 2.f;
    }
    
    CGAffineTransform _transform = CGAffineTransformMakeRotation(_angle);
    screenShotView.transform = _transform;
    [[transitionContext containerView] addSubview:screenShotView];  // 截屏放在最上面
    fromViewController.view.alpha = 0;
    
//    if (toViewController.tabBarController && toViewController.hidesBottomBarWhenPushed == NO ) {
//        UITabBar *tabBar = [toViewController.tabBarController tabBar];
//        CGRect frame = tabBar.frame;
//        frame.origin.x = 0;
//        tabBar.frame = frame;
//    }
    
    [UIView animateWithDuration:_ANIM_DURATION_ delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        screenShotView.frame = CGRectMake(_screen_width, 0, _screen_width, _screen_height);
    } completion:^(BOOL finished) {
        [screenShotView removeFromSuperview];
        if ( finished ) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }
    }];
}

@end

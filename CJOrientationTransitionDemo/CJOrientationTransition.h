//
//  CJOrientationTransition.h
//  CJOrientationTransitionDemo
//
//  Created by fminor on 2018/8/26.
//  Copyright © 2018 fminor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJOrientationTransition : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) UINavigationControllerOperation operation;
/// 屏幕截图
@property (nonatomic, assign) UIImage *screenShot;
/// 屏幕截图时的方向
@property (nonatomic, assign) UIDeviceOrientation orientation;

@end

NS_ASSUME_NONNULL_END

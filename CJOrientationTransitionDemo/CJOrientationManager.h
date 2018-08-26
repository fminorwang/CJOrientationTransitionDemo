//
//  CJOrientationManager.h
//  CJOrientationTransitionDemo
//
//  Created by fminor on 2018/8/26.
//  Copyright © 2018 fminor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJOrientationManager : NSObject

+ (CJOrientationManager *)sharedManager;

/// 当前支持的设备方向，默认 portrait
@property (nonatomic, assign) UIInterfaceOrientationMask supportedOrientationMask;

- (void)changeDeviceOrientationToPortrait;
- (void)changeDeviceOrientationToLandscape;

@end

NS_ASSUME_NONNULL_END

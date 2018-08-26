//
//  CJOrientationManager.m
//  CJOrientationTransitionDemo
//
//  Created by fminor on 2018/8/26.
//  Copyright © 2018 fminor. All rights reserved.
//

#import "CJOrientationManager.h"

static CJOrientationManager *_gOrientationManager;

@implementation CJOrientationManager

+ (CJOrientationManager *)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _gOrientationManager = [[CJOrientationManager alloc] init];
    });
    return _gOrientationManager;
}

- (instancetype)init {
    self = [super init];
    if ( self ) {
        _supportedOrientationMask = UIInterfaceOrientationMaskPortrait;
    }
    return self;
}

- (void)changeDeviceOrientationToPortrait {
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationUnknown) forKey:@"orientation"];
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationPortrait) forKey:@"orientation"];
}

- (void)changeDeviceOrientationToLandscape {
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationUnknown) forKey:@"orientation"];
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationLandscapeLeft) forKey:@"orientation"];
}

@end

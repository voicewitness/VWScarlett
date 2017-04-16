//
//  VWThemeManager.m
//  VWScarlett
//
//  Created by VoiceWitness on 11/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import "VWThemeManager.h"
#import "VWButtonRender.h"

@interface VWThemeManager()

@property (nonatomic, weak) UIView *rootView;

@end

@implementation VWThemeManager

- (void)applyScarlettForView:(UIView *)view {
    self.rootView = view;
}

- (void)applyTheme:(VWTheme *)theme forView:(UIView *)view {
    
//    [view.subviews makeObjectsPerformSelector:@selector(applyTheme:) withObject:theme];
    [self applyScarlettForView:view];
    [self updateTheme:theme forView:view];
}

- (void)updateTheme:(VWTheme *)theme forView:(UIView *)view {
    if ([view isKindOfClass:[UIButton class]]) {
        [VWButtonRender renderTheme:theme forView:view];
    } else {
        [VWViewRender renderTheme:theme forView:view];
    }
    for (UIView *subView in view.subviews) {
        [self updateTheme:theme forView:subView];
    }
}

- (void)cleanTheme {
    
}

@end

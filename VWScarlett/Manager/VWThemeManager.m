//
//  VWThemeManager.m
//  VWScarlett
//
//  Created by VoiceWitness on 11/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import "VWThemeManager.h"
#import "VWButtonRender.h"
#import "VWTextRender.h"
#import "VWScarlett.h"

typedef Class (^VWRenderHookBlock)(UIView *);

@interface VWThemeManager()

@property (nonatomic, weak) VWScarlett *scarlett;

@property (nonatomic, weak) UIView *rootView;

@end

@implementation VWThemeManager

- (instancetype)initWithScarlett:(VWScarlett *)scarlett {
    self = [super init];
    self.scarlett = scarlett;
    return self;
}

- (void)applyScarlettForView:(UIView *)view {
    self.rootView = view;
}

- (void)applyTheme:(VWTheme *)theme forView:(UIView *)view {
    [self applyTheme:theme forView:view withRenderHook:nil];
}
- (void)applyTheme:(VWTheme *)theme forView:(UIView *)view withRenderHook:(VWRenderHookBlock)renderHook {
    [self applyScarlettForView:view];
    [self updateTheme:theme forView:view withRenderHook:renderHook];
}

- (void)updateTheme:(VWTheme *)theme forView:(UIView *)view withRenderHook:(VWRenderHookBlock)renderHook {
    id renderClass;
    if(renderHook) {
        renderClass = renderHook(view);
        if(![renderClass respondsToSelector:@selector(renderTheme:forView:)]) {
            renderClass = nil;
        }
    }
    if (!renderClass) {
        if ([view isKindOfClass:[UIButton class]]) {
            renderClass = [VWButtonRender class];
        } else if([view isKindOfClass:[UILabel class]]) {
            renderClass = [VWTextRender class];
        } else {
            renderClass = [VWViewRender class];
        }
    }
    [renderClass renderTheme:theme forView:view];
    for (UIView *subView in view.subviews) {
        [self updateTheme:theme forView:subView withRenderHook:renderHook];
    }
}

- (void)cleanTheme {
    
}

@end

//
//  UIView+VWScarlett.m
//  VWScarlett
//
//  Created by VoiceWitness on 10/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import "UIView+VWScarlett.h"
#import <objc/runtime.h>
#import "VWScarlett.h"

const static char kScrlettKey;

const static char kScrletThemeClassKey;

const static char kScrletThemeIdKey;

@implementation UIView (VWScarlett)

+ (void)load {
    Method originalMethod = class_getInstanceMethod(self, sel_registerName("dealloc"));
    Method swizzledMethod = class_getClassMethod(self, @selector(vw_dealloc));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)addSubview:(UIView *)view inTheme:(VWScarlett *)theme {
    [self addSubview:view];
}

- (void)addSubview:(UIView *)view withThemeId:(NSString *)themeId {
    [self addSubview:view];
}

- (NSString *)scarlettThemeClass {
    return objc_getAssociatedObject(self, &kScrletThemeClassKey);
}

- (void)setScarlettThemeClass:(NSString *)scarlettThemeClass {
    objc_setAssociatedObject(self, &kScrletThemeClassKey, scarlettThemeClass, OBJC_ASSOCIATION_COPY);
}

- (NSString *)scarlettThemeId {
    return objc_getAssociatedObject(self, &kScrletThemeIdKey);
}

- (void)setScarlettThemeId:(NSString *)scarlettThemeId {
    objc_setAssociatedObject(self, &kScrletThemeIdKey, scarlettThemeId, OBJC_ASSOCIATION_COPY);
}

- (void)applyScarlett:(VWScarlett *)scarlett {
    objc_setAssociatedObject(self, &kScrlettKey, scarlett, OBJC_ASSOCIATION_RETAIN);
    [scarlett.themeManager applyScarlettForView:self];
}

- (VWScarlett *)scarlett {
    return (objc_getAssociatedObject(self, &kScrlettKey)?:self.superview.scarlett);
}

- (void)applyTheme:(VWTheme *)theme {
    if (!self.scarlett) {
        [self applyScarlett:[VWScarlett new]];
    }
    [self.scarlett.themeManager applyTheme:theme forView:self];
}

- (void)vw_dealloc {
    [VWThemeManager deallocThemeWithId:[NSString stringWithFormat:@"%zd",&self]];
    [self vw_dealloc];
}

@end

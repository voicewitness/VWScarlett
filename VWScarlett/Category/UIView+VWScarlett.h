//
//  UIView+VWScarlett.h
//  VWScarlett
//
//  Created by VoiceWitness on 10/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VWScarlett,VWTheme;

@protocol VWThemeRender;

@interface UIView (VWScarlett)

@property (nonatomic, copy) NSString *scarlettThemeClass;

//@property (nonatomic, copy) NSString *scarlettThemeId;

@property (nonatomic, readonly) VWScarlett *scarlett;

- (void)applyTheme:(VWTheme *)theme;

- (void)applyTheme:(VWTheme *)theme withRenderHook:(Class (^)(UIView *view))renderHook;

@end

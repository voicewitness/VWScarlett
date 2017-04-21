//
//  VWThemeManager.h
//  VWScarlett
//
//  Created by VoiceWitness on 11/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class VWScarlett;
@class VWTheme;

@interface VWThemeManager : NSObject

- (instancetype)initWithScarlett:(VWScarlett *)scarlett;

//- (void)deallocThemeWithId:(NSString *)themeId;

//- (void)cleanTheme;

- (void)applyTheme:(VWTheme *)theme forView:(UIView *)view;

- (void)applyScarlettForView:(UIView *)view;

@end

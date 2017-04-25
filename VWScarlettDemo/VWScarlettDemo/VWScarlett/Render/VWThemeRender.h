//
//  VWThemeRender.h
//  VWScarlettDemo
//
//  Created by VoiceWitness on 25/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VWTheme;

@protocol VWThemeRender <NSObject>

+ (void)renderTheme:(VWTheme *)theme forView:(UIView *)view;

@end

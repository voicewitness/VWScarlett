//
//  VWViewRender.h
//  VWScarlettDemo
//
//  Created by VoiceWitness on 16/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "VWThemeRender.h"

@class VWTheme;

@interface VWViewRender : NSObject <VWThemeRender>

+ (void)renderTheme:(VWTheme *)theme forView:(UIView *)view;

@end

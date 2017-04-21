//
//  VWViewRender.m
//  VWScarlettDemo
//
//  Created by VoiceWitness on 16/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import "VWViewRender.h"
#import "UIView+VWScarlett.h"
#import "VWTheme.h"
#import "VWScarlettTranslator.h"

@implementation VWViewRender

+ (void)renderTheme:(VWTheme *)theme forView:(UIView *)view {
    NSDictionary *styles = [theme stylesForClass:view.scarlettThemeClass];
    [self updateStyles:styles forView:view];
}

+ (void)updateStyles:(NSDictionary *)styles forView:(UIView *)view
{
    if (!styles.count) {
        return;
    }
    if (styles[@"background-color"]) {
        view.backgroundColor = [VWScarlettTranslator UIColor:styles[@"background-color"]];
    }
    
    if (styles[@"opacity"]) {
        CGFloat opacity = [VWScarlettTranslator CGFloat:styles[@"opacity"]];
        view.layer.opacity = opacity;
    }
    
    if (styles[@"visibility"]) {
        BOOL visibility = [VWScarlettTranslator visibility:styles[@"visibility"]];
        view.hidden = visibility;
    }
}

@end

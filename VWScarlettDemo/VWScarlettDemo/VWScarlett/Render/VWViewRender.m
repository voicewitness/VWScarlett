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
    
    if (styles[@"border-color"]) {
        CGColorRef borderColor = [VWScarlettTranslator CGColor:styles[@"border-color"]];
        view.layer.borderColor = borderColor;
    }
    
    if (styles[@"border-width"]) {
        CGFloat borderWidth = [VWScarlettTranslator CGFloat:styles[@"border-width"]];
        view.layer.borderWidth = borderWidth;
    }
    
    if(styles[@"border-radius"]) {
        CGFloat cornerRadius = [VWScarlettTranslator CGFloat:styles[@"border-radius"]];
        view.layer.cornerRadius = cornerRadius;
        view.layer.masksToBounds = YES;
    }
}

@end

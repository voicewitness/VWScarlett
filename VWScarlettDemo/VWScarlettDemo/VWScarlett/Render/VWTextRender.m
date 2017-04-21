//
//  VWTextRender.m
//  VWScarlettDemo
//
//  Created by VoiceWitness on 16/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import "VWTextRender.h"
#import "VWScarlettTranslator.h"

@implementation VWTextRender

+ (void)updateStyles:(NSDictionary *)styles forView:(UILabel *)view {
    [super updateStyles:styles forView:view];
    if (styles[@"color"]) {
        view.textColor = [VWScarlettTranslator UIColor:styles[@"backgroundColor"]];
    }
    
    if (styles[@"font-size"]) {
        view.font = [view.font fontWithSize:[VWScarlettTranslator CGFloat:styles[@"font-size"]]];
    }
}

@end

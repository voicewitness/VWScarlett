//
//  VWButtonRender.m
//  VWScarlettDemo
//
//  Created by VoiceWitness on 16/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import "VWButtonRender.h"
#import "VWTextRender.h"

@implementation VWButtonRender

+ (void)updateStyles:(NSDictionary *)styles forView:(UIButton *)view {
    if (styles[@"color"]) {
        [VWTextRender updateStyles:@{@"color":styles[@"color"]} forView:view.titleLabel];
    }
    if (styles[@"font-size"]) {
        [VWTextRender updateStyles:@{@"font-size":styles[@"font-size"]} forView:view.titleLabel];
    }
}

@end

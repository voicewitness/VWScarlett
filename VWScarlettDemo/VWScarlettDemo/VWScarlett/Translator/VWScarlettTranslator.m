//
//  VWScarlettTranslator.m
//  VWScarlettDemo
//
//  Created by VoiceWitness on 16/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import "VWScarlettTranslator.h"

@implementation VWScarlettTranslator

+ (UIColor *)UIColor:(NSString *)value {
    double red = 255, green = 255, blue = 255, alpha = 1.0;
    if([value hasPrefix:@"#"]) {
        
        if (value.length == 4) {
            unichar c_r =   [value characterAtIndex:1];
            unichar c_g =   [value characterAtIndex:2];
            unichar c_b =   [value characterAtIndex:3];
            unichar c_a =   'f';
            value = [NSString stringWithFormat:@"#%C%C%C%C%C%C%C%C", c_r, c_r, c_g, c_g, c_b, c_b, c_a, c_a];
        } else if (value.length == 7) {
            value = [value stringByAppendingString:@"ff"];
        }
        uint32_t colorValue = 0;
        sscanf(value.UTF8String, "#%x", &colorValue);
        red     = ((colorValue & 0xFF000000) >> 24) / 255.0;
        green   = ((colorValue & 0x00FF0000) >> 16) / 255.0;
        blue    = ((colorValue & 0x0000FF00) >> 8) / 255.0;
        alpha    = (colorValue & 0x000000FF) / 255.0;
    } else if ([value hasPrefix:@"rgb("]) {
        int r,g,b;
        sscanf(value.UTF8String, "rgb(%d,%d,%d)", &r, &g, &b);
        red = r / 255.0;
        green = g / 255.0;
        blue = b / 255.0;
    } else if ([value hasPrefix:@"rgba("]) {
        int r,g,b;
        sscanf(value.UTF8String, "rgba(%d,%d,%d,%lf)", &r, &g, &b, &alpha);
        red = r / 255.0;
        green = g / 255.0;
        blue = b / 255.0;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGColorRef)CGColor:(NSString *)value {
    return [[self UIColor:value]CGColor];
}

+ (CGFloat)CGFloat:(NSString *)value
{
    if ([value hasSuffix:@"px"]) {
        value = [value substringToIndex:(value.length - 2)];
    }
    return [value doubleValue];
}

+ (BOOL)visibility:(NSString *)value {
    if ([value isEqualToString:@"visible"]) {
        return YES;
    } else if ([value isEqualToString:@"hidden"]) {
        return NO;
    }
    return YES;
}

+ (NSTextAlignment)textAlignment:(NSString *)value {
    if ([value isEqualToString:@"right"]) {
        return NSTextAlignmentRight;
    } else if ([value isEqualToString:@"center"]) {
        return NSTextAlignmentCenter;
    }
    return NSTextAlignmentLeft;
}

@end

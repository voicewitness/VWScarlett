//
//  VWScarlettTranslator.h
//  VWScarlettDemo
//
//  Created by VoiceWitness on 16/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VWScarlettTranslator : NSObject

+ (UIColor *)UIColor:(NSString *)value;

+ (CGColorRef)CGColor:(NSString *)value;

+ (CGFloat)CGFloat:(NSString *)value;

+ (BOOL)visibility:(NSString *)value;

+ (NSTextAlignment)textAlignment:(NSString *)value;

@end

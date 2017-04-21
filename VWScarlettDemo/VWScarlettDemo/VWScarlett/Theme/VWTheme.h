//
//  VWTheme.h
//  VWScarlettDemo
//
//  Created by VoiceWitness on 13/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VWTheme : NSObject

- (void)addStyleName:(NSString *)name value:(NSString *)value forClass:(NSString *)CSSClass;

- (void)addStyleName:(NSString *)name value:(NSString *)value forId:(NSString *)CSSId;

- (NSDictionary *)stylesForClass:(NSString *)CSSClass;

@end

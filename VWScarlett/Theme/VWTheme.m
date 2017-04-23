//
//  VWTheme.m
//  VWScarlettDemo
//
//  Created by VoiceWitness on 13/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import "VWTheme.h"

@interface VWTheme()

@property (nonatomic, strong) NSMutableDictionary *classStylesPool;

@property (nonatomic, strong) NSMutableDictionary *idStylesPool;

@end

@implementation VWTheme

- (instancetype)init {
    self = [super init];
    _classStylesPool = [NSMutableDictionary new];
    _idStylesPool = [NSMutableDictionary new];
    return self;
}

- (void)addStyleName:(NSString *)name value:(NSString *)value forClass:(NSString *)CSSClass {
    if (!value) {
        return;
    }
    [[self getStylesForClass:CSSClass]setObject:value forKey:name];;
}

- (void)addStyleName:(NSString *)name value:(NSString *)value forId:(NSString *)CSSId {
    if (!value) {
        return;
    }
    [[self getStylesForId:CSSId]setObject:value forKey:name];
}

- (NSDictionary *)stylesForClass:(NSString *)CSSClass {
    return [self getStylesForClass:CSSClass];
}

- (NSMutableDictionary *)getStylesForClass:(NSString *)CSSClass {
    if (!CSSClass) {
        return nil;
    }
    NSMutableDictionary *styles = self.classStylesPool[CSSClass];
    if(!styles) {
        styles = [NSMutableDictionary new];
        self.classStylesPool[CSSClass] = styles;
    }
    return styles;
}

- (NSMutableDictionary *)getStylesForId:(NSString *)CSSId {
    if (!CSSId) {
        return nil;
    }
    NSMutableDictionary *styles = self.idStylesPool[CSSId];
    if(!styles) {
        styles = [NSMutableDictionary new];
        self.idStylesPool[CSSId] = styles;
    }
    return styles;
}

@end

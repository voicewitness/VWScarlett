//
//  VWScarlett.m
//  VWScarlett
//
//  Created by VoiceWitness on 10/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import "VWScarlett.h"

@interface VWScarlett()

@property (nonatomic, readwrite, strong) VWThemeManager *themeManager;

@end

@implementation VWScarlett

- (instancetype)init {
    self = [super init];
    NSInteger scarlettId = 0;
    @synchronized(self){
        static NSInteger __scarlettId = 0;
        scarlettId = __scarlettId % (1024*1024);
        __scarlettId++;
    }
    _scarlettId = [NSString stringWithFormat:@"%ld", (long)scarlettId];
    
    return self;
}



- (VWThemeManager *)themeManager {
    if (!_themeManager) {
        _themeManager = [[VWThemeManager alloc]initWithScarlett:self];
    }
    return _themeManager;
}

@end

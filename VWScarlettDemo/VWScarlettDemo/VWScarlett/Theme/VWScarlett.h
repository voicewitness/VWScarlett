//
//  VWScarlett.h
//  VWScarlett
//
//  Created by VoiceWitness on 10/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VWThemeManager.h"

@interface VWScarlett : NSObject

@property (nonatomic, strong) NSString *scarlettId;

@property (nonatomic, readonly, strong) VWThemeManager *themeManager;

@end

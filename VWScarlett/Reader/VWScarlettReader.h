//
//  VWScarlettReader.h
//  VWScarlett
//
//  Created by VoiceWitness on 13/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VWTheme;
@interface VWScarlettReader : NSObject

+ (VWTheme *)readFromFileURL:(NSURL *)fileURL;

@end

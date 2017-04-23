//
//  VWScarlettReader.m
//  VWScarlett
//
//  Created by VoiceWitness on 13/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import "VWScarlettReader.h"
#import "VWTheme.h"

typedef NS_ENUM(NSInteger, ReaderState) {
    ReaderStateClassify,
    ReaderStateStyle
};

typedef ReaderState (^StateBlock)(NSScanner *scanner, NSString **result);

@implementation VWScarlettReader

+ (VWTheme *)readFromFileURL:(NSURL *)fileURL {
    NSError *readError = nil;
    NSString *content = [NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:&readError];
    return [self readFromContent:content];
}

+ (VWTheme *)readFromContent:(NSString *)content {
    
    NSScanner *scanner = [NSScanner scannerWithString:content];
    
    [scanner setCaseSensitive: YES];
    [scanner setScanLocation: 0];
    
    VWTheme *theme = [VWTheme new];
    
    while (![scanner isAtEnd]) {
        
        [scanner scanUpToString:@"." intoString:nil];
        if ([scanner isAtEnd]) break;
        NSInteger CSSClassNameDefineStart = scanner.scanLocation + 1;
        
        [scanner scanUpToString:@"{" intoString:nil];
        if ([scanner isAtEnd]) break;
        
        NSInteger CSSDefineStart = scanner.scanLocation + 1;
        NSArray *CSSClassesArray = [[content substringWithRange:NSMakeRange(CSSClassNameDefineStart, CSSDefineStart - CSSClassNameDefineStart - 1)]componentsSeparatedByString:@","];
        
        [scanner scanUpToString:@"}" intoString:nil];
        if ([scanner isAtEnd]) break;
        
        NSInteger CSSDefineEnd = scanner.scanLocation + 1;
        
        NSString *CSSDef = [content substringWithRange:NSMakeRange(CSSDefineStart, CSSDefineEnd - CSSDefineStart - 1)];
        
        NSArray *cssStyles = [CSSDef componentsSeparatedByString:@";"];
        for (NSString *cssstyle in cssStyles) {
            NSString *style = [cssstyle stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            if ([style rangeOfString:@":"].location != NSNotFound) {
                NSArray *styleItem = [style componentsSeparatedByString:@":"];
                NSString *styleName = [styleItem.firstObject stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                NSString *styleValue = [styleItem.lastObject stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                for (NSString *CSSClass in CSSClassesArray) {
                    [theme addStyleName:styleName value:styleValue forClass:[CSSClass stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
                }
            }else if(style.length > 0){
                NSLog(@"style defines are incorrect at location %zd",scanner.scanLocation);
            }
            
        }
    }
    return theme;
}

@end

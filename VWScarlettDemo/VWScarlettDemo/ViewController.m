//
//  ViewController.m
//  VWScarlettDemo
//
//  Created by VoiceWitness on 13/04/2017.
//  Copyright © 2017 voicewh. All rights reserved.
//

#import "ViewController.h"
#import "VWScarlettReader.h"
#import "UIView+VWScarlett.h"
#import "VWThemeRender.h"
#import "VWTheme.h"
#import "VWScarlettTranslator.h"

@interface CusRender : NSObject <VWThemeRender>

@end

@implementation CusRender

+ (void)renderTheme:(VWTheme *)theme forView:(UIView *)view {
    NSDictionary *styles = [theme stylesForClass:view.scarlettThemeClass];
    if (styles[@"my-color"]) {
        view.backgroundColor = [VWScarlettTranslator UIColor:styles[@"my-color"]];
    }
}

@end

@interface ViewController ()

@end

@implementation ViewController {
    VWTheme *_theme;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *fileURL = [[NSBundle mainBundle]URLForResource:@"testStyle" withExtension:@"theme"];
    [self testColor];
    [self testText];
    [self testBorder];
    _theme = [VWScarlettReader readFromFileURL:fileURL];
    [self.view applyTheme:_theme];
    [self testCustomRender];
}

- (void)testColor {
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    v.scarlettThemeClass = @"test-color";
    [self.view addSubview:v];
}

- (void)testText {
    UILabel *v = [[UILabel alloc]initWithFrame:CGRectMake(110, 0, 100, 100)];
    v.scarlettThemeClass = @"test-font";
    v.text = @"test font";
    [self.view addSubview:v];
}

- (void)testBorder {
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(220, 0, 100, 100)];
    v.scarlettThemeClass = @"test-border";
    [self.view addSubview:v];
}

- (void)testCustomRender {
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 110, 100, 100)];
    v.scarlettThemeClass = @"cus-render";
    [self.view addSubview:v];
    [v applyTheme:_theme withRenderHook:^Class(UIView *view) {
        return [CusRender class];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

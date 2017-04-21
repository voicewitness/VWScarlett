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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *fileURL = [[NSBundle mainBundle]URLForResource:@"testStyle" withExtension:@"theme"];
    self.view.scarlettThemeClass = @"redStyle";
    [self.view applyTheme:[VWScarlettReader readFromFileURL:fileURL]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

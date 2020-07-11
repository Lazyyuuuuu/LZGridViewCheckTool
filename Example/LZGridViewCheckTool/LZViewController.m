//
//  LZViewController.m
//  LZGridViewCheckTool
//
//  Created by lazyyuuuuu on 07/11/2020.
//  Copyright (c) 2020 lazyyuuuuu. All rights reserved.
//

#import "LZViewController.h"
#import <LZGridViewCheckTool/LZGridWindow.h>

@interface LZViewController ()

@end

@implementation LZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[LZGridWindow sharedInstance] show];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

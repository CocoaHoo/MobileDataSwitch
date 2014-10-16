//
//  ViewController.m
//  MobileDataSwich
//
//  Created by ly on 9/29/14.
//  Copyright (c) 2014 ly. All rights reserved.
//

#import "ViewController.h"

extern BOOL CTCellularDataPlanGetIsEnabled();
extern void CTCellularDataPlanSetIsEnabled(BOOL enabled);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.tipsLabel.text = NSLocalizedString(@"Cellular Data", nil);
    
    BOOL enabled = CTCellularDataPlanGetIsEnabled();
    self.mobileDataSwith.on = enabled;
}

#pragma mark - IBAction
- (IBAction)valueChanged:(id)sender {
    UISwitch *switch1 = (UISwitch *)sender;
    [self setMobileDataEnabled:switch1.on];
}

- (void)setMobileDataEnabled:(BOOL)enabled
{
    CTCellularDataPlanSetIsEnabled(enabled);
    self.mobileDataSwith.on = CTCellularDataPlanGetIsEnabled();
}

@end

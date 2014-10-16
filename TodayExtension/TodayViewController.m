//
//  TodayViewController.m
//  TodayExtension
//
//  Created by victorjiang on 10/17/14.
//  Copyright (c) 2014 ly. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

extern BOOL CTCellularDataPlanGetIsEnabled();
extern void CTCellularDataPlanSetIsEnabled(BOOL enabled);

@interface TodayViewController () <NCWidgetProviding>

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISwitch *switch1;


@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.label.text = NSLocalizedString(@"Cellular Data", nil);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    BOOL enabled = CTCellularDataPlanGetIsEnabled();
    self.switch1.on = enabled;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

#pragma mark - IBAction
- (IBAction)valueChanged:(id)sender {
    UISwitch *switch1 = (UISwitch *)sender;
    [self setMobileDataEnabled:switch1.on];
}

- (void)setMobileDataEnabled:(BOOL)enabled
{
    CTCellularDataPlanSetIsEnabled(enabled);
    self.switch1.on = CTCellularDataPlanGetIsEnabled();
}

@end

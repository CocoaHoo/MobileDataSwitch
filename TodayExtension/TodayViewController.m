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

@property (weak, nonatomic) IBOutlet UIButton *cellularButton;

- (IBAction)celluarButtonAction:(id)sender;


@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.preferredContentSize = CGSizeMake(CGRectGetWidth(self.view.frame), 64);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    BOOL enabled = CTCellularDataPlanGetIsEnabled();
    self.cellularButton.selected = enabled;
    
    if (self.cellularButton.selected) {
        self.cellularButton.alpha = 1;
    } else {
        self.cellularButton.alpha = 0.5;
    }
    
    
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
- (IBAction)celluarButtonAction:(id)sender {
    [self setMobileDataEnabled:!self.cellularButton.selected];
}

- (void)setMobileDataEnabled:(BOOL)enabled
{
    CTCellularDataPlanSetIsEnabled(enabled);
    self.cellularButton.selected = CTCellularDataPlanGetIsEnabled();
    
    if (self.cellularButton.selected) {
        self.cellularButton.alpha = 1;
    } else {
        self.cellularButton.alpha = 0.5;
    }
}



@end

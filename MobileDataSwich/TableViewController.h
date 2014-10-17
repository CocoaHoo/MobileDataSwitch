//
//  TableViewController.h
//  MobileDataSwich
//
//  Created by victorjiang on 10/17/14.
//  Copyright (c) 2014 ly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UISwitch *mobileDataSwith;

- (void)updateCellularState;

@end

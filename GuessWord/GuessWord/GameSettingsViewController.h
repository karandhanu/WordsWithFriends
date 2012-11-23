//
//  GameSettingsViewController.h
//  GuessWord
//
//  Created by Karan Dhanu on 2012-11-22.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameSettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UISwitch *autoUpdate;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UILabel *connectedToData;

@end

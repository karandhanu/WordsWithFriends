//
//  GameSettingsViewController.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-11-22.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import "GameSettingsViewController.h"
#import "GameInputOutput.h"

@interface GameSettingsViewController ()

@end

@implementation GameSettingsViewController

@synthesize username;
@synthesize password;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Do any additional setup after loading the view.
    username.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    password.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
}
- (IBAction)manualUpdate:(id)sender
{
    [GameInputOutput getCurrentTextListFrom:@"http://thehhd.com/CMPT385/accounts/" forUser:@"test_user" remoteFilename:@"/wordlist.txt"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

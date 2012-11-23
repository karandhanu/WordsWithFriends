//
//  GameSettingsViewController.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-11-22.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import "GameSettingsViewController.h"
#import "GameInputOutput.h"
#import "GameViewController.h"

@interface GameSettingsViewController ()

@end

@implementation GameSettingsViewController

@synthesize username;
@synthesize password;
@synthesize connectedToData;
bool hasDataConnection= NO;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)doneEnterCredentials:(id)sender
{
    NSUserDefaults *userCredentials = [NSUserDefaults standardUserDefaults];
    if (![username.text isEqualToString:[userCredentials stringForKey:@"username"]])
    {
        [userCredentials setObject:username.text forKey:@"username"];
        NSLog(@"%@",username.text);
    }
    if (![password.text isEqualToString:[userCredentials stringForKey:@"password"]])
    {
        [userCredentials setObject:password.text forKey:@"password"];
    }
    
    //download the new word list based on the username
    [GameInputOutput getCurrentJSONListFrom:@"http://chrishobbs.ca/groupb" forUser:username.text remoteFilename:@"wordlist.json"];
    
    [self performSegueWithIdentifier:@"doneCredentials" sender:self];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    hasDataConnection = [GameInputOutput isDataSourceAvailable];
    NSString * boolString = hasDataConnection ? @"Connected To Data" : @"No Data Connection";
    connectedToData.text = boolString;
    connectedToData.enabled = YES;
    if(hasDataConnection)
    {
        connectedToData.textColor =  [UIColor colorWithRed:0.10f green:0.53f blue:0.03f alpha:1.0f];
    }
    else
    {
        connectedToData.textColor =  [UIColor redColor];
    }
    
    //display the username, password and age
    username.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    password.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    }
- (IBAction)manualUpdate:(id)sender
{
    [GameInputOutput getCurrentTextListFrom:@"http://chrishobbs.ca/groupb" forUser:@"kam" remoteFilename:@"/wordlist.txt"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

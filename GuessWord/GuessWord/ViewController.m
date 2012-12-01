//
//  ViewController.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-10-19.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import "ViewController.h"
#import "GameInputOutput.h"
#import "SystemConfiguration/SCNetworkReachability.h"
#import "GameSettingsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize display = _display;
NSString *username;
NSString *password;
bool isFirstLoad = YES;
bool hasDataConnectionAvailable = NO;
NSMutableArray *firstWordName;
NSMutableArray *spellingpattern;

NSMutableArray *allWordsFromWeb;

bool shouldDownloadFile = YES;

- (void)viewDidLoad
{
    [super viewDidLoad];
    hasDataConnectionAvailable = [GameInputOutput isDataSourceAvailable];
    
    //download the new Json wordlist only if we are connected to the internet
    if(hasDataConnectionAvailable)
    {
        if (shouldDownloadFile)
        {
            NSArray *arr = [GameSettingsViewController displayUserCredentials];
            
            NSString *authToken = [arr objectAtIndex:2];
            //get the username and password stored in NSuserDefaults
            //http://stackoverflow.com/questions/782451/iphone-sdk-load-save-settings
            
            //download the file if username is not empty
            if(![authToken isEqualToString:@""])
            {
                //get the json file based on the username and password
                //method from Red Panda team
                [GameInputOutput writeJsonToFile:@"http://chrishobbs.ca/groupb" authenticationToken:authToken];
                shouldDownloadFile = NO;
            }
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
}




@end

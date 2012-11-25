//
//  ViewController.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-10-19.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import "ViewController.h"
#import "GameInputOutput.h"
//#include <SystemConfiguration/SystemConfiguration.h>
//#include <netinet/in.h>
#import "SystemConfiguration/SCNetworkReachability.h"

//following lines for importing JSON file
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define LatestsynPhonywordsURL [NSURL URLWithString: @"http://synphony.herokuapp.com/api/simplified/simple_english/words?focus=b&known=b,a,t,r,s"] 

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



- (void)viewDidLoad
{
    [super viewDidLoad];
    hasDataConnectionAvailable = [GameInputOutput isDataSourceAvailable];
    
    //download the new Json wordlist only if we are connected to the internet
    if(hasDataConnectionAvailable)
    {
        if (isFirstLoad)
        {
            //get the json file based on the username and password
            //get the username and password stored in NSuserDefaults
            username = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
            password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
            
            //download the file if username is not empty
            if(![username isEqualToString:@""])
            {
                //get the json file based on the username and password
                //method from Red Panda team
                [GameInputOutput writeJsonToFile:@"http://chrishobbs.ca/groupb" forUsername:username forUserpassword:password remoteFilename:@"wordlist.json"];
                isFirstLoad = NO;
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

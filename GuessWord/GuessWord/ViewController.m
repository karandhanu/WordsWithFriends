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
//#import "SystemConfiguration/SCNetworkReachability.h"

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
NSMutableArray *firstWordName;
NSMutableArray *spellingpattern;

NSMutableArray *allWordsFromWeb;



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self isDataSourceAvailable];
    
    if (isFirstLoad)
    {
        //get the json file based on the username and password
        //get the username and password stored in NSuserDefaults
        username = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
        password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
        NSLog(@"%@", username);
        [GameInputOutput getCurrentJSONListFrom:@"http://chrishobbs.ca/groupb" forUser:username remoteFilename:@"wordlist.json"];
        isFirstLoad = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
}

//this method will check if we are connected to interent or not.
//http://stackoverflow.com/questions/477852/checking-for-internet-connectivity-in-objective-c
- (BOOL)isDataSourceAvailable
{
    bool _isDataSourceAvailable = NO;
    static BOOL checkNetwork = YES;
    if (checkNetwork) { // Since checking the reachability of a host can be expensive, cache the result and perform the reachability check once.
        checkNetwork = NO;
        
        //Boolean success;
        const char *host_name = "twitter.com"; // your data source host name
        //SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, host_name);
        //SCNetworkReachabilityFlags flags;
        //success = SCNetworkReachabilityGetFlags(reachability, &flags);
        //_isDataSourceAvailable = success && (flags & kSCNetworkFlagsReachable) && !(flags & kSCNetworkFlagsConnectionRequired);
        //CFRelease(reachability);
    }
    return _isDataSourceAvailable;
}



@end

//
//  ViewController.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-10-19.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import "ViewController.h"
#import "GameIO.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize display = _display;
bool isFirstLoad = YES;
NSMutableArray *firstWordName;
NSMutableArray *spellingpattern;

NSMutableArray *allWordsFromWeb;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    if (isFirstLoad)
    {
        
        //[GameIO getCurrentJSONListFrom:@"http://thehhd.com/CMPT385/accounts/" forUser:@"test_user" remoteFilename:@"wordlist.json"];
        isFirstLoad = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
}


//this method successfully downloads the JSON data to data.json file
//http://stackoverflow.com/questions/9446503/how-can-i-save-a-json-response-to-a-file-that-would-be-accessible-from-within-a


@end

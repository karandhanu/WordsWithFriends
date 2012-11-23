//
//  ViewController.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-10-19.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import "ViewController.h"
#import "GameInputOutput.h"

//following lines for importing JSON file
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define LatestsynPhonywordsURL [NSURL URLWithString: @"http://synphony.herokuapp.com/api/simplified/simple_english/words?focus=b&known=b,a,t,r,s"] 

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
        
        [GameInputOutput getCurrentJSONListFrom:@"http://thehhd.com/CMPT385/accounts/" forUser:@"test_user" remoteFilename:@"wordlist.json"];
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

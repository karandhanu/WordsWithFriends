//
//  HighScoreViewController.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-11-02.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import "HighScoreViewController.h"

@interface HighScoreViewController ()

@end

@implementation HighScoreViewController

int baseScore = 100;
int highScore = 0;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)calculateHighScore:(int)totalWordsCompleted
{
    [self saveScore];
}

-(void)saveScore
{
    //NSString *string1;
    //NSString *string2;
    //NSString *string3;
    
    NSArray *stringsArray = [NSArray arrayWithObjects:@"hello",@"this",@"world",@"etc",nil];
    
   // NSArray *stringsArray = [[NSArray alloc] arrayWithObjects: string1, string2, string3, nil];
    [[NSUserDefaults standardUserDefaults] setObject:stringsArray forKey:@"MyStrings"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)readScores
{
    //NSArray *stringsArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"MyStrings"];
    
    //printing out everything from nslog
    //NSLog(@"%@", [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] allKeys]);
    
}


@end

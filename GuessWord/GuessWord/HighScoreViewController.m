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

@synthesize playerName1;
@synthesize playerName2;
//@synthesize playerName3;
//@synthesize playerName4;
//@synthesize playerName5;
//@synthesize playerName6;
//@synthesize playerName7;
//@synthesize playerName8;
//@synthesize playerName9;
//@synthesize playerName10;
@synthesize highScore1;
@synthesize highScore2;
//@synthesize highScore3;
//@synthesize highScore4;
//@synthesize highScore5;
//@synthesize highScore6;
//@synthesize highScore7;
//@synthesize highScore8;
//@synthesize highScore9;
//@synthesize highScore10;

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
   // [self saveScore];
    
	// Do any additional setup after loading the view.
    [self readScores];
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
    NSUserDefaults *userCredentials = [NSUserDefaults standardUserDefaults];
    
    NSString *name = [userCredentials objectForKey:@"username"];
    NSString *score = @"10";
    
    NSUserDefaults *userScore = [NSUserDefaults standardUserDefaults];
    
    [userScore setObject:name forKey:@"playerName1"];
    [userScore setObject:score forKey:@"highscore1"];
}

-(void)readScores
{
    //NSArray *stringsArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"MyStrings"];
    
    //printing out everything from nslog
    //NSLog(@"%@", [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] allKeys]);
    NSUserDefaults *userScore = [NSUserDefaults standardUserDefaults];
    
    playerName1.text = [userScore objectForKey:@"playerName1"];
   highScore1.text = [userScore objectForKey:@"highscore1"];
  //  playerName1.hidden = NO;
    //highScore1.hidden = NO;
}


@end

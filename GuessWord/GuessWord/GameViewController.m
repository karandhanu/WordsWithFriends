//
//  GameViewController.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-10-29.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import "GameViewController.h"
#import "LevelCompleteViewController.h"
#import "GameInputOutput.h"
#import "HighScoreViewController.h"
#include <QuartzCore/QuartzCore.h>

@interface GameViewController ()

@end

@implementation GameViewController

@synthesize display = _display;
@synthesize display2 = _display2;
@synthesize displayTotalTries = _displayTotalTries;
@synthesize letter1 = _letter1;
@synthesize letter2 = _letter2;
@synthesize letter3 = _letter3;
@synthesize letter4 = _letter4;
@synthesize letter5 = _letter5;
@synthesize letter6 = _letter6;
@synthesize letter7 = _letter7;
@synthesize letter8 = _letter8;
@synthesize letter9 = _letter9;
@synthesize letter10 = _letter10;
@synthesize letter11 = _letter11;
@synthesize letter12 = _letter12;
@synthesize letter13 = _letter13;
@synthesize letter14 = _letter14;
@synthesize letter15 = _letter15;
@synthesize letter16 = _letter16;
@synthesize letter17 = _letter17;
@synthesize letter18 = _letter18;
@synthesize letter19 = _letter19;
@synthesize letter20 = _letter20;
@synthesize letter21 = _letter21;
@synthesize letter22 = _letter22;
@synthesize letter23 = _letter23;
@synthesize letter24 = _letter24;
@synthesize letter25 = _letter25;
@synthesize letter26 = _letter26;
@synthesize displayCorrectWord;
@synthesize screenUsername;
@synthesize scoreCount;

NSMutableString *correctWord;

NSMutableString *gameWord;

NSArray *allWords;

NSMutableArray *wordsArray;

NSMutableArray *spellingSequenceArray;

//total no of tries a user gets to complete a word.
int totalNumberOfTriesLeft = 0;

//check if the letter maches again what user entered.
BOOL doesEnterLetterMatch = false;

//keep trakcs of no. of letters user guessed correctly.
int wordCompleteCounter = 0;

//keep counter of what word user is playing.
int playNextWordCounter = 0;

//checks if word is complete or not
bool isWordComplete = false;

//total number of words user will complete
int totalWordCompletedCounter = 0;

//base score to be awarded
int gameScore = 0;


//Initializes the arrays of UI objects and inserts the UI Objects
-(void)initUIArrays
{
    wordsArray = [[NSMutableArray alloc] init];
    spellingSequenceArray = [[NSMutableArray alloc] init];
}

//this creates the wordlist from the jsonfile that was downloaded when game was set up
//by this method is modified version of Team Red Panda
- (void) loadGameData
{
    NSUserDefaults *userCredentials = [NSUserDefaults standardUserDefaults];
    NSString *token = [userCredentials objectForKey:@"authcode"];
    NSString *filePath = @"" ;
    if(![token isEqualToString:@""] && [token length] != 0)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"data.json"];
    }
    else
    {
        filePath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"json"];
    }
    [GameInputOutput gameDataFromJSON:filePath outputWordsTo:wordsArray outputSpellingsTo:spellingSequenceArray];
}

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
    screenUsername.title = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"].uppercaseString;
    
    [self initUIArrays];
    [self loadGameData];
    NSLog(@"%@",wordsArray);
    
    //initializing first word
    gameWord = [NSMutableString stringWithFormat:@"hello"];
       
    allWords = wordsArray;
    
    // initalizing number of tries a user has to complete the word
    [self createTotalNumberOfTriesForWord];
    //displays the input label based on word length
    [self displayLabels];
    wordCompleteCounter = 0;
    playNextWordCounter = 0;
    totalWordCompletedCounter = 0;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//This method initailized total number of tries
- (void) createTotalNumberOfTriesForWord
{
    totalNumberOfTriesLeft = [gameWord length]+1;
    UILabel *TriesDisplay = self.displayTotalTries;
    NSString *TotalTriesAvailable = [NSString stringWithFormat:@"%d", totalNumberOfTriesLeft];
    TriesDisplay.text = TotalTriesAvailable;
}

//This method updates the number of tries left to complete a word
-(void) updateTotalNumberofTriesForWord
{
    totalNumberOfTriesLeft--;
    UILabel *TriesDisplay = self.displayTotalTries;
    NSString *TotalTriesAvailable = [NSString stringWithFormat:@"%d", totalNumberOfTriesLeft];
    TriesDisplay.text = TotalTriesAvailable;
    
}

//This method enables the keyboard
-(void) enableAllLetters
{
    _letter1.enabled =YES;
    _letter2.enabled =YES;
    _letter3.enabled =YES;
    _letter4.enabled =YES;
    _letter5.enabled =YES;
    _letter6.enabled =YES;
    _letter7.enabled =YES;
    _letter8.enabled =YES;
    _letter9.enabled =YES;
    _letter10.enabled =YES;
    _letter11.enabled =YES;
    _letter12.enabled =YES;
    _letter13.enabled =YES;
    _letter14.enabled =YES;
    _letter15.enabled =YES;
    _letter16.enabled =YES;
    _letter17.enabled =YES;
    _letter18.enabled =YES;
    _letter19.enabled =YES;
    _letter20.enabled =YES;
    _letter21.enabled =YES;
    _letter22.enabled =YES;
    _letter23.enabled =YES;
    _letter24.enabled =YES;
    _letter25.enabled =YES;
    _letter26.enabled =YES;
}

//This displays all the labels
-(void) displayLabels
{
    int wordLength = [gameWord length];
    UILabel *myDisplay = self.display;
    UILabel *myDisplay2 = self.display2;
    UILabel *myDisplay3 = self.display3;
    UILabel *myDisplay4 = self.display4;
    UILabel *myDisplay5 = self.display5;
    UILabel *myDisplay6 = self.display6;
    UILabel *myDisplay7 = self.display7;
    
    [myDisplay setHidden:YES];
    [myDisplay2 setHidden:YES];
    [myDisplay3 setHidden:YES];
    [myDisplay4 setHidden:YES];
    [myDisplay5 setHidden:YES];
    [myDisplay6 setHidden:YES];
    [myDisplay7 setHidden:YES];
    
    [myDisplay setText:@""];
    [myDisplay2 setText:@""];
    [myDisplay3 setText:@""];
    [myDisplay4 setText:@""];
    [myDisplay5 setText:@""];
    [myDisplay6 setText:@""];
    [myDisplay7 setText:@""];
    
    myDisplay.layer.borderWidth = 2.0;
    myDisplay2.layer.borderWidth = 2.0;
    myDisplay3.layer.borderWidth = 2.0;
    myDisplay4.layer.borderWidth = 2.0;
    myDisplay5.layer.borderWidth = 2.0;
    myDisplay6.layer.borderWidth = 2.0;
    myDisplay7.layer.borderWidth = 2.0;

    
    
    if(wordLength == 3)
    {
        [myDisplay setHidden:NO];
        [myDisplay2 setHidden:NO];
        [myDisplay3 setHidden:NO];
    }
    else if(wordLength == 4)
    {
        [myDisplay setHidden:NO];
        [myDisplay2 setHidden:NO];
        [myDisplay3 setHidden:NO];
        [myDisplay4 setHidden:NO];
    }
    else if (wordLength == 5)
    {
        [myDisplay setHidden:NO];
        [myDisplay2 setHidden:NO];
        [myDisplay3 setHidden:NO];
        [myDisplay4 setHidden:NO];
        [myDisplay5 setHidden:NO];
    }
    else if(wordLength == 6)
    {
        [myDisplay setHidden:NO];
        [myDisplay2 setHidden:NO];
        [myDisplay3 setHidden:NO];
        [myDisplay4 setHidden:NO];
        [myDisplay5 setHidden:NO];
        [myDisplay6 setHidden:NO];  
    }
    else if(wordLength == 7)
    {
        [myDisplay setHidden:NO];
        [myDisplay2 setHidden:NO];
        [myDisplay3 setHidden:NO];
        [myDisplay4 setHidden:NO];
        [myDisplay5 setHidden:NO];
        [myDisplay6 setHidden:NO];
        [myDisplay7 setHidden:NO];
    }
}

- (IBAction)playAgain:(id)sender
{
    
    [self moveToNextWord];
}

//This method skips the current word user is on then move to next word
-(void) moveToNextWord
{
   
    if(playNextWordCounter < ([allWords count] -1))
    {
        displayCorrectWord.text = @"";
        [self enableAllLetters];
        isWordComplete = false;
        wordCompleteCounter = 0;
        playNextWordCounter++;
        gameWord = [allWords objectAtIndex:playNextWordCounter];
        
        [self createTotalNumberOfTriesForWord];
        [self displayLabels];
    }
    else
    {
        
        NSString *score = [NSString stringWithFormat:@"%d", gameScore];
        if(![score isEqualToString:@"0"])
        {
            [HighScoreViewController saveScore:score];
        }
        [self performSegueWithIdentifier:@"identifier_levelComplete" sender:(self)];
    }
    
}

//this method updates the score on the screen
-(void)checkNumberofWordsUserCompleteInLevel:(BOOL) completeWord
{
    if(completeWord)
    {
        gameScore = 50;
        totalWordCompletedCounter++;
        gameScore = totalWordCompletedCounter * gameScore;
        NSString *score = [NSString stringWithFormat:@"%d", gameScore];
        scoreCount.text = score;
    }
}

//ths method moves to main menu and save score
- (IBAction)backToMainMenu:(id)sender
{
    //save the score before player exists the game
    NSString *score = [NSString stringWithFormat:@"%d", gameScore];
    if(![score isEqualToString:@"0"])
    {
        [HighScoreViewController saveScore:score];
    }
    [self performSegueWithIdentifier:@"mainMenuIdentifier" sender:self];
}

//1. get the letter pressed
//2. check if letter pressed exists in the word
//3. display at the letter in the each label it corrsespondes to
- (IBAction)buttonPressed:(UIButton *)sender
{
    //pointer to a string object
    NSString *letter = [sender currentTitle];
    
    //create a local label
    UILabel *myDisplay = self.display;
    UILabel *myDisplay2 = self.display2;
    UILabel *myDisplay3 = self.display3;
    UILabel *myDisplay4 = self.display4;
    UILabel *myDisplay5 = self.display5;
    UILabel *myDisplay6 = self.display6;
    UILabel *myDisplay7 = self.display7;
    
    //this is converting gameWord to an array so I can itirate over
    NSMutableArray *lettersArray = [[NSMutableArray alloc] initWithCapacity:[gameWord length]];
    
    int trackIndexId;
    int trackSecondIndexForSameLetter;
    bool indexAlreadySet = false;
    for (int x = 0 ; x <= [gameWord length]-1 ; x++) {
        
        NSMutableString *eachLetter = [[NSMutableString alloc]initWithFormat:@"%C",[gameWord characterAtIndex:x]];
        
        [lettersArray addObject:eachLetter];
        
    }
    
    for ( int x = 0;  x < [lettersArray count] ; x++) {
        
        if([[lettersArray objectAtIndex: x] isEqual:letter.lowercaseString])
        {
            if(!indexAlreadySet)
            {
                trackIndexId = x;
                indexAlreadySet = true;
            }
            
            if(indexAlreadySet)
            {
                trackSecondIndexForSameLetter = x;
            }
            doesEnterLetterMatch = true;
            wordCompleteCounter++;
        }
        
    }
    
    if(!isWordComplete)
    {
        if(totalNumberOfTriesLeft > 0)
        {
            if(doesEnterLetterMatch)
            {
                doesEnterLetterMatch = false;
                indexAlreadySet = false;
                
                if(trackIndexId == 0)
                {
                    myDisplay.text =  letter;   
                }
                else if(trackSecondIndexForSameLetter == 0)
                {
                    myDisplay.text =  letter;   
                }
                
                if(trackIndexId == 1)
                {
                    myDisplay2.text =  letter;
                }
                else if(trackSecondIndexForSameLetter == 1)
                {
                    myDisplay2.text =  letter;
                }
                
                if(trackIndexId == 2)
                {
                    myDisplay3.text =  letter;
                }
                else if(trackSecondIndexForSameLetter == 2)
                {
                    myDisplay3.text =  letter;
                }
                
                if(trackIndexId == 3)
                {
                    myDisplay4.text =  letter;
                }
                else if(trackSecondIndexForSameLetter == 3)
                {
                    myDisplay4.text =  letter;
                }
                
                if(trackIndexId == 4)
                {
                    myDisplay5.text =  letter;
                }
                else if(trackSecondIndexForSameLetter == 4)
                {
                    myDisplay5.text =  letter;
                }
                
                if(trackIndexId == 5)
                {
                    myDisplay6.text =  letter;
                }
                else if(trackSecondIndexForSameLetter == 5)
                {
                    myDisplay6.text =  letter;
                }
                if(trackIndexId == 6)
                {
                    myDisplay7.text =  letter;
                }
                else if(trackSecondIndexForSameLetter == 6)
                {
                    myDisplay7.text =  letter;
                }
                //disabled the button
                [sender setEnabled:NO];
                
                //set the back groundcolor
                [sender setBackgroundColor:[UIColor greenColor]];                
            }
            else
            {
                //reduce the total number tries by 1
                [self updateTotalNumberofTriesForWord];
                //diabled the button
                [sender setEnabled:NO];
                //set the background color
                [sender setBackgroundColor:[UIColor redColor]];
                //if user has no tries left then display the correct word
                if(totalNumberOfTriesLeft == 0)
                {
                    displayCorrectWord.text = gameWord.uppercaseString;
                    displayCorrectWord.enabled = YES;
                    displayCorrectWord.hidden = NO;
                    displayCorrectWord.textColor = [UIColor whiteColor];
                }
            }
        }
        //what to do what to do
        //means user failed to complete the word
        //move the next words
        else
        {
            
        }
    }
    else
    {
        
    }
    
    if(wordCompleteCounter == [lettersArray count])
    {
        isWordComplete = true;
    }
    
    if(isWordComplete)
    {
        [myDisplay setHidden:YES];
        [myDisplay2 setHidden:YES];
        [myDisplay3 setHidden:YES];
        [myDisplay4 setHidden:YES];
        [myDisplay5 setHidden:YES];
        [myDisplay6 setHidden:YES];
        [myDisplay7 setHidden:YES];
        [self checkNumberofWordsUserCompleteInLevel:isWordComplete];
        [self moveToNextWord];
    }
    
}


@end
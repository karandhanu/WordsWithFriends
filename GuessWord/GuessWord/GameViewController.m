//
//  GameViewController.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-10-29.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import "GameViewController.h"

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

NSMutableString *gameWord;

NSArray *allWords;

int TotalNumberOfTriesLeft = 0;

BOOL doesEnterLetterMatch = false;

int wordCompleteCounter = 0;

int playNextWordCounter = 0;

bool isWordComplete = false;

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
    //initializing
    gameWord = [NSMutableString stringWithFormat:@"pants"];
    
    allWords = [NSArray arrayWithObjects:@"hello",@"this",@"world",@"etc",nil];
    
    [self CreateTotalNumberOfTriesForWord];
    [self DisplayLabels];
    wordCompleteCounter = 0;
    playNextWordCounter = 0;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//This method initailized total number of tries
- (void) CreateTotalNumberOfTriesForWord
{
    TotalNumberOfTriesLeft = [gameWord length]/2;
    UILabel *TriesDisplay = self.displayTotalTries;
    NSString *TotalTriesAvailable = [NSString stringWithFormat:@"%d", TotalNumberOfTriesLeft];
    TriesDisplay.text = TotalTriesAvailable;
}

//This method updates the number of tries left to complete a word
-(void) UpdateTotalNumberofTriesForWord
{
    TotalNumberOfTriesLeft--;
    UILabel *TriesDisplay = self.displayTotalTries;
    NSString *TotalTriesAvailable = [NSString stringWithFormat:@"%d", TotalNumberOfTriesLeft];
    TriesDisplay.text = TotalTriesAvailable;
    
}

-(void) EnableAllLetters
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

//this displays all the labels
-(void) DisplayLabels
{
    int wordLength = [gameWord length];
    UILabel *myDisplay = self.display;
    UILabel *myDisplay2 = self.display2;
    UILabel *myDisplay3 = self.display3;
    UILabel *myDisplay4 = self.display4;
    UILabel *myDisplay5 = self.display5;
    UILabel *myDisplay6 = self.display6;
    
    [myDisplay setHidden:YES];
    [myDisplay2 setHidden:YES];
    [myDisplay3 setHidden:YES];
    [myDisplay4 setHidden:YES];
    [myDisplay5 setHidden:YES];
    [myDisplay6 setHidden:YES];
    
    [myDisplay setText:@""];
    [myDisplay2 setText:@""];
    [myDisplay3 setText:@""];
    [myDisplay4 setText:@""];
    [myDisplay5 setText:@""];
    [myDisplay6 setText:@""];
    
    
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
}

- (IBAction)playAgain:(id)sender
{
    
    [self MoveToNextWord];
}

-(void) MoveToNextWord
{
    if(playNextWordCounter < ([allWords count] -1))
    {
        [self EnableAllLetters];
        isWordComplete = false;
        wordCompleteCounter = 0;
        playNextWordCounter++;
        gameWord = [allWords objectAtIndex:playNextWordCounter];
        
        [self CreateTotalNumberOfTriesForWord];
        [self DisplayLabels];
    }
    
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
    
    //this is converting gameWord to an array so I can itirate over
    NSMutableArray *lettersArray = [[NSMutableArray alloc] initWithCapacity:[gameWord length]];
    
    int trackIndexId;
    for (int x = 0 ; x <= [gameWord length]-1 ; x++) {
        
        NSMutableString *eachLetter = [[NSMutableString alloc]initWithFormat:@"%C",[gameWord characterAtIndex:x]];
        
        [lettersArray addObject:eachLetter];
        
    }
    
    for ( int x = 0;  x < [lettersArray count] ; x++) {
        
        if([[lettersArray objectAtIndex: x] isEqual:letter.lowercaseString])
        {
            trackIndexId = x;
            doesEnterLetterMatch = true;
            wordCompleteCounter++;
        }
    }
    
    if(!isWordComplete)
    {
        if(TotalNumberOfTriesLeft > 0)
        {
            if(doesEnterLetterMatch)
            {
                doesEnterLetterMatch = false;
                
                if(trackIndexId == 0)
                {
                    myDisplay.text =  letter;   
                }
                
                if(trackIndexId == 1)
                {
                    myDisplay2.text =  letter;
                }
                
                if(trackIndexId == 2)
                {
                    myDisplay3.text =  letter;
                }
                if(trackIndexId == 3)
                {
                    myDisplay4.text =  letter;
                }
                
                if(trackIndexId == 4)
                {
                    myDisplay5.text =  letter;
                }
                if(trackIndexId == 5)
                {
                    myDisplay6.text =  letter;
                }
                
                //disabled the button
                [sender setEnabled:NO];
                
                //set the back groundcolor
                [sender setBackgroundColor:[UIColor greenColor]];                
            }
            else
            {
                //reduce the total number tries by 1
                [self UpdateTotalNumberofTriesForWord];
                //diabled the button
                [sender setEnabled:NO];
                //set the background color
                [sender setBackgroundColor:[UIColor redColor]];                
            }
        }
        //what to do what to do
        //means user failed to complete the word
        //move the next word
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
        [self MoveToNextWord];
    }
    
}

@end

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

NSMutableString *gameWord ;

int TotalNumberOfTriesLeft = 0;

BOOL doesEnterLetterMatch = false;

int wordComplete = 0;

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
    gameWord = [NSMutableString stringWithFormat:@"kran"];
    [self CreateTotalNumberOfTriesForWord];
    [self DisplayLabels];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//this method initailized total number of tries
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
    
    //returns what is on the label
    //NSString *currentText= myDisplay.text;
    //NSString *newText = [currentText stringByAppendingString:digit];
    //for (int i = 0; i <= gameWord.length; i++) {
    
    //var s = [globalString characterAtIndex:i];
    //if([globalString characterAtIndex:i == digit.cString])
    
    //const unsigned char *newLetter = (const unsigned char *) [letter UTF8String];
    //skif(testChar == newLetter)
    
    //}
    //unsigned int len = [letter length];
    //char buffer[len + 1];
    
    //strncpy(buffer, [letter UTF8String],len);
    
    
    //char current;
    //for(int i = 0; i < len; ++i) {
    //  current = buffer[i];
    //NSLog(@"my ns string = %c", current);
    //convert nsmutablestring to nsmutablearray
    //}
    
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
            
            //remove item from the array once we found it
            [lettersArray removeObjectAtIndex:x];
            wordComplete = [lettersArray count];
        }
    }
    
    if(wordComplete > 0)
    {
        if(TotalNumberOfTriesLeft > 0)
        {
            if(doesEnterLetterMatch)
            {
                UIImage *buttonImagePressed = [UIImage imageNamed:@"King.png"];
                //UIImage *buttonImagePressed = [[UIImage imageNamed:@"icon.png"]
                //resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
                
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
                
                //set the background image
                [sender setBackgroundImage:buttonImagePressed forState:UIControlStateNormal];
                
            }
            else
            {
                //reduce the total number tries by 1
                
                [self UpdateTotalNumberofTriesForWord];
                UIImage *buttonImagePressed = [UIImage imageNamed:@"incorrect.png"];
                //diabled the button
                [sender setEnabled:NO];
                //set the background coloe
                [sender setBackgroundColor:[UIColor redColor]];
                //set background color
                [sender setBackgroundImage:buttonImagePressed forState:UIControlStateNormal];
                
            }
        }
        //what to do what to do
        else
        {
            
        }
    }
}

@end

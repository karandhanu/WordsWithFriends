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

NSMutableString *gameWord ;


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
    gameWord = [NSMutableString stringWithFormat:@"karan"];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//1. get the letter pressed
//2. check if letter pressed exists in the word
//3. display at the letter in the each label it corrsespondes to
- (IBAction)buttonPressed:(UIButton *)sender
{
    //pointer to a string object
    NSString *letter = [sender currentTitle];
    
    //NSLog(@"my ns string = %@", letter);
    
    //create a local label
    UILabel *myDisplay = self.display;
    
    //returns what is on the label
    //NSString *currentText= myDisplay.text;
    //NSString *newText = [currentText stringByAppendingString:digit];
    for (int i = 0; i <= gameWord.length; i++) {
        
         
        //NSLog(@"my ns string = %@", testChar);
        //var s = [globalString characterAtIndex:i];
        //if([globalString characterAtIndex:i == digit.cString])
        
        //const unsigned char *newLetter = (const unsigned char *) [letter UTF8String];
        //skif(testChar == newLetter)
        
    }
    unsigned int len = [letter length];
    char buffer[len + 1];
    
    strncpy(buffer, [letter UTF8String],len);
 

    char current;
    for(int i = 0; i < len; ++i) {
        current = buffer[i];
        //NSLog(@"my ns string = %c", current);
        //convert nsmutablestring to nsmutablearray
    }
    
    //this is converting gameWord to an array so I can itirate over
    NSMutableArray *lettersArray = [[NSMutableArray alloc] initWithCapacity:[gameWord length]];
    
    for (int x = 0 ; x <= [gameWord length]-1 ; x++) {
        
        NSMutableString *eachLetter = [[NSMutableString alloc]initWithFormat:@"%C",[gameWord characterAtIndex:x]];
        
        [lettersArray addObject:eachLetter];
        //[eachLetter release];
        //NSLog(@"my ns string = %@", eachLetter);
    }
    
    
    for ( int x = 0;  x < [lettersArray count] ; x++) {
        
       // NSLog(@"Value of subArray: %@ at index: %d", [[lettersArray objectAtIndex:x] ], x);
        // do something with object
        //NSLog(@"%@",[lettersArray objectAtIndex: x]);
        //NSLog(@"my ns string = %@", letter.lowercaseString);
        if([[lettersArray objectAtIndex: x] isEqual:letter.lowercaseString])
        {
            
            NSLog(@"inside if loop");
        }
        else
        {
            NSLog(@"elemet is not inside the loop");
        }
       
    }
    myDisplay.text =  letter;
}

@end

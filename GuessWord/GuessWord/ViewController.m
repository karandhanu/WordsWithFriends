//
//  ViewController.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-10-19.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize display = _display;

NSMutableArray *allWordsFromWeb;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //initailizing mutable array fo capactity 10
    allWordsFromWeb = [NSMutableArray arrayWithCapacity:10];
    
    // Do any additional setup after loading the view, typically from a nib.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //code executed in the background
        //2
        NSData* synphonyData = [NSData dataWithContentsOfURL:
                            [NSURL URLWithString:@"http://synphony.herokuapp.com/api/simplified/simple_english/words"]
                            ];
        //3
        NSDictionary* json = nil;
        if (synphonyData) {
            json = [NSJSONSerialization
                    JSONObjectWithData:synphonyData
                    options:kNilOptions
                    error:nil];
        }
        
        //4
        dispatch_async(dispatch_get_main_queue(), ^{
            //code executed on the main queue
            //5
            [self updateUIWithDictionary: json];
        });
        
    });
}

-(void)updateUIWithDictionary:(NSDictionary*)json {
    @try {
        
        for(int i = 0; i <= 10; i++)
        {
            
            NSString *word = [NSString stringWithFormat:
                              json[@"words"][i][@"name"],
                              nil];
            [allWordsFromWeb addObject: word];
            NSLog(@"this is a %@",word);
        }
    }
    @catch (NSException *exception) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"Could not parse the JSON feed."
                                   delegate:nil
                          cancelButtonTitle:@"Close"
                          otherButtonTitles: nil] show];
        
        //this will print all the words to the console
        NSLog(@"Exception: %@", exception);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

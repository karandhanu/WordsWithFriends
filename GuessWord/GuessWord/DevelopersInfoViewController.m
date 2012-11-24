//
//  DevelopersInfoViewController.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-11-23.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import "DevelopersInfoViewController.h"

@interface DevelopersInfoViewController ()

@end

@implementation DevelopersInfoViewController

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
- (IBAction)PressedKaran:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://www.linkedin.com/in/karandhanu"];
    if (![[UIApplication sharedApplication] openURL:url])
        NSLog(@"%@%@",@"Failed to open url:",[url description]);
    
}

@end

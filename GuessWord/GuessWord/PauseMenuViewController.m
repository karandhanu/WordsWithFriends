//
//  PauseMenuViewController.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-11-02.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import "PauseMenuViewController.h"
#import "PauseMenuProtocol.h"

@interface PauseMenuViewController ()

@end

@implementation PauseMenuViewController

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
- (IBAction)Resume:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:(YES) completion:nil];
    [self.delegate goToResume];
}

@end

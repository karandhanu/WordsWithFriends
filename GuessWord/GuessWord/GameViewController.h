//
//  GameViewController.h
//  GuessWord
//
//  Created by Karan Dhanu on 2012-10-29.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PauseMenuProtocol.h"

@interface GameViewController : UIViewController <PauseMenuProtocol, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UILabel *displayTotalTries;
@property (weak, nonatomic) IBOutlet UILabel *display2;
@property (weak, nonatomic) IBOutlet UILabel *display3;
@property (weak, nonatomic) IBOutlet UILabel *display4;
@property (weak, nonatomic) IBOutlet UILabel *display5;
@property (weak, nonatomic) IBOutlet UILabel *display6;
@property (weak, nonatomic) IBOutlet UIButton *letter1;
@property (weak, nonatomic) IBOutlet UIButton *letter2;
@property (weak, nonatomic) IBOutlet UIButton *letter3;
@property (weak, nonatomic) IBOutlet UIButton *letter4;
@property (weak, nonatomic) IBOutlet UIButton *letter5;
@property (weak, nonatomic) IBOutlet UIButton *letter6;
@property (weak, nonatomic) IBOutlet UIButton *letter7;
@property (weak, nonatomic) IBOutlet UIButton *letter8;
@property (weak, nonatomic) IBOutlet UIButton *letter9;
@property (weak, nonatomic) IBOutlet UIButton *letter10;
@property (weak, nonatomic) IBOutlet UIButton *letter11;
@property (weak, nonatomic) IBOutlet UIButton *letter12;
@property (weak, nonatomic) IBOutlet UIButton *letter13;
@property (weak, nonatomic) IBOutlet UIButton *letter14;
@property (weak, nonatomic) IBOutlet UIButton *letter15;
@property (weak, nonatomic) IBOutlet UIButton *letter16;
@property (weak, nonatomic) IBOutlet UIButton *letter17;
@property (weak, nonatomic) IBOutlet UIButton *letter18;
@property (weak, nonatomic) IBOutlet UIButton *letter19;
@property (weak, nonatomic) IBOutlet UIButton *letter20;
@property (weak, nonatomic) IBOutlet UIButton *letter21;
@property (weak, nonatomic) IBOutlet UIButton *letter22;
@property (weak, nonatomic) IBOutlet UIButton *letter23;
@property (weak, nonatomic) IBOutlet UIButton *letter24;
@property (weak, nonatomic) IBOutlet UIButton *letter25;
@property (weak, nonatomic) IBOutlet UIButton *letter26;
@property (weak, nonatomic) IBOutlet UILabel *displayCorrectWord;
@property (weak, nonatomic) IBOutlet UINavigationItem *screenUsername;
@property (weak, nonatomic) IBOutlet UILabel *scoreCount;


@end

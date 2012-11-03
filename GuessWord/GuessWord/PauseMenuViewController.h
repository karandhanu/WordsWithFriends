//
//  PauseMenuViewController.h
//  GuessWord
//
//  Created by Karan Dhanu on 2012-11-02.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PauseMenuProtocol.h"

@protocol PauseMenuProtocol;



@interface PauseMenuViewController : UIViewController
@property (nonatomic, strong) id <PauseMenuProtocol> delegate;

@end

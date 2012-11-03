//
//  PauseMenuProtocol.h
//  GuessWord
//
//  Created by Karan Dhanu on 2012-11-02.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PauseMenuProtocol : NSObject

@end

@protocol PauseMenuProtocol <NSObject>

@optional
-(void) goToResume;

@end
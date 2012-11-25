//
//  GameInputOutput.h
//  GuessWord
//
//  Created by Karan Dhanu on 2012-11-22.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameInputOutput : NSObject
+ (void) getCurrentTextListFrom:(NSString *)baseURL forUser:(NSString *)username remoteFilename:(NSString *)filename;
+ (void)gameDataFromJSON:(NSString *)filePath outputWordsTo:(NSMutableArray *)outputWordsArray outputSpellingsTo:(NSMutableArray *)outputSpellingsArray;
+ (void) writeJsonToFile:(NSString *)baseURL forUsername:(NSString *)username forUserpassword:(NSString *)password remoteFilename:(NSString *)filename;
+ (BOOL)isDataSourceAvailable;
@end

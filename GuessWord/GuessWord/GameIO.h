//
//  GameIO.h
//  GuessWord
//
//  Created by Karan Dhanu on 2012-11-02.
//  Copyright (c) 2012 TeamB. All rights reserved.
//
//  Code Standard:
//  http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html
//

#import <Foundation/Foundation.h>

@interface GameIO : NSObject

+ (void) getCurrentTextListFrom:(NSString *)baseURL forUser:(NSString *)username remoteFilename:(NSString *)filename;
+ (void) getCurrentJSONListFrom:(NSString *)baseURL forUser:(NSString *)username remoteFilename:(NSString *)filename;
+ (void)gameDataFromJSON:(NSString *)filePath outputWordsTo:(NSMutableArray *)outputWordsArray outputSpellingsTo:(NSMutableArray *)outputSpellingsArray;

@end

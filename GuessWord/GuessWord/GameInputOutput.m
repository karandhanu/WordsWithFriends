//
//  GameInputOutput.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-11-22.
//  Copyright (c) 2012 TeamB. All rights reserved.
//
//this method successfully downloads the JSON data to data.json file
//http://stackoverflow.com/questions/9446503/how-can-i-save-a-json-response-to-a-file-that-would-be-accessible-from-within-a
//and contributions from Red panda

#import "GameInputOutput.h"

@implementation GameInputOutput

+ (void) getCurrentTextListFrom:(NSString *)baseURL forUser:(NSString *)username remoteFilename:(NSString *)filename
{
    //Set file path to write file to
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"txt"];
    // Download and write to file
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", baseURL, username, filename]];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    [urlData writeToFile:filePath atomically:YES];
}

+ (void) getCurrentJSONListFrom:(NSString *)baseURL forUser:(NSString *)username remoteFilename:(NSString *)filename
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"json"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", baseURL, username, filename]];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    [urlData writeToFile:filePath atomically:YES];
}

+ (void)gameDataFromJSON:(NSString *)filePath outputWordsTo:(NSMutableArray *)outputWordsArray outputSpellingsTo:(NSMutableArray *)outputSpellingsArray
{
    NSError *error;
    NSData* JSONData = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&error];
    
    NSArray* latestWordlist = [JSONDictionary objectForKey:@"words"];
    
    for (int i = 0; i < latestWordlist.count; i++)
    {
        NSDictionary *wordNameDictionary = [latestWordlist objectAtIndex:i];
        [outputWordsArray addObject:[wordNameDictionary objectForKey:@"name"]];
    }
    for (int i = 0; i < latestWordlist.count; i++)
    {
        NSDictionary *spellingPatternDictionary = [latestWordlist objectAtIndex:i];
        [outputSpellingsArray addObject:[spellingPatternDictionary objectForKey:@"spelling_patterns"]];
    }
}
@end

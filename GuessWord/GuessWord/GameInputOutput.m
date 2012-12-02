//
//  GameInputOutput.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-11-22.
//  Copyright (c) 2012 TeamB. All rights reserved.
//
//this method successfully downloads the JSON data to data.json file
//http://stackoverflow.com/questions/9446503/how-can-i-save-a-json-response-to-a-file-that-would-be-accessible-from-within-a

#import "GameInputOutput.h"
#import "SystemConfiguration/SCNetworkReachability.h"

@implementation GameInputOutput

///This method will download the file from JSON source url and used from
//http://stackoverflow.com/questions/9446503/how-can-i-save-a-json-response-to-a-file-that-would-be-accessible-from-within-a

+ (void) writeJsonToFile:(NSString *)token
{
    NSString *stringURL = @"http://helpchildrenread.org/api/simplified/projects/tok_pisin/words?lesson=1&auth_token=";
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pathToFile = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"data.json"];
    
    //NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"json"];
    //construct the url to down the json file from somethings like
    //http://helpchildrenread.org/api/simplified/projects/tok_pisin/words?lesson=1&auth_token=?xkdkofofofososos
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", stringURL, token]];
    NSLog(@"%@",url);
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    //attempt to download live data
    if (urlData)
    {
        [urlData writeToFile:pathToFile atomically:YES];
    }
}



///this method is taken from Team Red Panda
+ (void)gameDataFromJSON:(NSString *)filePath outputWordsTo:(NSMutableArray *)outputWordsArray outputSpellingsTo:(NSMutableArray *)outputSpellingsArray
{
    NSError *error;
    //NSData* JSONData = [NSData dataWithContentsOfFile:filePath];
    //NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&error];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pathToFile = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"data.json"];
    
    NSData *jsonData = [NSData dataWithContentsOfFile:pathToFile options:kNilOptions error:&error ];
    
    //NSData* JSONData = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    
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

//this method will check if we are connected to interent or not.
//http://stackoverflow.com/questions/477852/checking-for-internet-connectivity-in-objective-c
+ (BOOL)isDataSourceAvailable
{
    bool _isDataSourceAvailable = NO;
    BOOL checkNetwork = YES;
    if (checkNetwork)
    { // Since checking the reachability of a host can be expensive, cache the result and perform the reachability check once.
        checkNetwork = NO;
        
        Boolean success;
        const char *host_name = "google.ca"; // your data source host name
        SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, host_name);
        SCNetworkReachabilityFlags flags;
        success = SCNetworkReachabilityGetFlags(reachability, &flags);
        _isDataSourceAvailable = success && (flags & kSCNetworkFlagsReachable) && !(flags & kSCNetworkFlagsConnectionRequired);
        CFRelease(reachability);
    }
    return _isDataSourceAvailable;
}

@end

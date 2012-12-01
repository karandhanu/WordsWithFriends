//
//  GameSettingsViewController.m
//  GuessWord
//
//  Created by Karan Dhanu on 2012-11-22.
//  Copyright (c) 2012 TeamB. All rights reserved.
//

#import "GameSettingsViewController.h"
#import "GameInputOutput.h"
#import "GameViewController.h"
#include <SystemConfiguration/SystemConfiguration.h>

@interface GameSettingsViewController ()

@end

@implementation GameSettingsViewController

@synthesize username;
@synthesize password;
@synthesize connectedToData;
@synthesize rememberMeToggle;
@synthesize errorMessage;

bool hasDataConnection= NO;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)doneEnterCredentials:(id)sender
{
    NSArray *arr = [GameSettingsViewController displayUserCredentials];
    
    //NSString *name = [arr objectAtIndex:0];
    //NSString *pass = [arr objectAtIndex:1];
    NSString *token = [arr objectAtIndex:2];
    //1.download the file when user has done entering username and password
    //2. download the file from sever only if username and password is not bank
    //3. I need to find a to authenicate these usernames and passwords
    if(![token isEqualToString:@""])
    {
        //get the json file based on the username and password
        [GameInputOutput writeJsonToFile:@"http://chrishobbs.ca/groupb" authenticationToken:token];
    }
    if([self saveUserCredentials:@"token"])
    {
        [self performSegueWithIdentifier:@"doneCredentials" sender:self];
    }
}


//http://stackoverflow.com/questions/7673127/iphone-sdk-xcode-4-2-ios-5-how-do-i-send-a-json-to-url-post-and-get-resolv
//http://stackoverflow.com/questions/4085978/json-post-request-on-the-iphone-using-https
- (void) authenicateUserAccount
{
    NSArray *arr = [GameSettingsViewController displayUserCredentials];
    
    NSString *name = [arr objectAtIndex:0];
    NSString *pass = [arr objectAtIndex:1];
    
    NSString *jsonRequest = @"{\"login\": {\"username\":\"karandhanu@gmail.com\",\"password\":\"hello003\",\"application\":\"my test app\",\"version\":\"0.0\"}}";
    //NSLog(@"Request: %@", jsonRequest);
    
    NSURL *url = [NSURL URLWithString:@"http://helpchildrenread.org/api/simplified/login"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSData *requestData = [NSData dataWithBytes:[jsonRequest UTF8String] length:[jsonRequest length]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSMutableData *retrievedData = [NSMutableData data];
    [retrievedData appendData:data];
    
    NSMutableString *a = [[NSMutableString alloc] initWithData:retrievedData encoding:NSASCIIStringEncoding];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"credentials" ofType:@"json"];
   
    NSData *userCredentials = a;
    NSLog(@"%@",a);
    [userCredentials writeToFile:filePath atomically:YES];
    
    NSError *error;
    NSData* JSONData = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&error];
    //get the log in information from the credentials file
    NSDictionary *login = [JSONDictionary objectForKey:@"login"];
    //get the auth_token
    NSDictionary *loginInfo = login;
    NSLog(@"%@",loginInfo);
    
    if(loginInfo == NULL)
    {
        errorMessage.text = @"Invalid username or password";
        errorMessage.hidden = NO;
    }
    else
    {
        NSString *authCode = [loginInfo objectForKey:@"auth_token"];
        [self saveUserCredentials:authCode];
    }
        //NSLog(@"%@",authCode);
}


- (void) connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]
             forAuthenticationChallenge:challenge];
    }
    
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

- (void) connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    if([[protectionSpace authenticationMethod] isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        //return YES;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self displayInternetConnectionStatus];
    
    [self authenicateUserAccount];
    //[self saveAuthToken];
    //this methof is drived from
    //http://stackoverflow.com/questions/782451/iphone-sdk-load-save-settings
    //display the username, password
    NSArray *arr = [GameSettingsViewController displayUserCredentials];
    
    NSString *name = [arr objectAtIndex:0];
    NSString *pass = [arr objectAtIndex:1];

    username.text = name;
    password.text = pass;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)rememberCredentials:(id)sender
{
    if(rememberMeToggle.isOn)
    {
        
    }
    if(!rememberMeToggle.isOn)
    {
        
    }
}

- (void) displayInternetConnectionStatus
{
    hasDataConnection = [GameInputOutput isDataSourceAvailable];
    NSString * boolString = hasDataConnection ? @"Connected To Data" : @"No Data Connection";
    connectedToData.text = boolString;
    connectedToData.enabled = YES;
    if(hasDataConnection)
    {
        connectedToData.textColor =  [UIColor colorWithRed:0.10f green:0.53f blue:0.03f alpha:1.0f];
    }
    else
    {
        connectedToData.textColor =  [UIColor redColor];
    }
}

-(void) saveAuthToken
{
    NSString *token = @"43rg78pS6HX0c2g5pDL1XQ";
    NSUserDefaults *userCredentials = [NSUserDefaults standardUserDefaults];
    [userCredentials setObject:token forKey:@"authcode"];
}

//this method is drived from 
//http://stackoverflow.com/questions/782451/iphone-sdk-load-save-settings
- (BOOL) saveUserCredentials:(NSString *)token
{
    NSUserDefaults *userCredentials = [NSUserDefaults standardUserDefaults];
    bool saveCredentails = false;
    //only save credentials if user has remember me button to on
    if(rememberMeToggle.isOn)
    {
        
        if ((![username.text isEqualToString:@""]) && (![password.text isEqualToString:@""] && ![password.text isEqualToString:@"password"]) && (![token isEqualToString:@""]))
        {
            [userCredentials setObject:username.text forKey:@"username"];
            [userCredentials setObject:password.text forKey:@"password"];
            [userCredentials setObject:token forKey:@"authcode"];
            return true;
        }
        else if ([username.text isEqualToString:@""] &&[password.text isEqualToString:@""])
        {
            username.text = @"";
            password.text = @"";
            [userCredentials setObject:username.text forKey:@"username"];
            [userCredentials setObject:password.text forKey:@"password"];
            return true;
        }
        else if([username.text isEqualToString:@""] ||[password.text isEqualToString:@""])
        {
            username.text = @"";
            password.text = @"";

            [userCredentials setObject:username.text forKey:@"username"];
            [userCredentials setObject:password.text forKey:@"password"];
            errorMessage.text = @"Invalid username or password";
            errorMessage.hidden = NO;
            return false;
        }
        
    }
    //do not save credentials
    else
    {
        username.text = @"";
        password.text = @"";
        [userCredentials setObject:username.text forKey:@"username"];
        [userCredentials setObject:password.text forKey:@"password"];
        return true;
    }
    return saveCredentails;
}

//This method is drived from
//http://stackoverflow.com/questions/3080713/method-with-2-return-values
+(NSArray*) displayUserCredentials
{
    NSUserDefaults *userCredentials = [NSUserDefaults standardUserDefaults];
    
    NSString *name = [userCredentials objectForKey:@"username"];
    NSString *pass =[userCredentials objectForKey:@"password"];
    NSString *token = [userCredentials objectForKey:@"authcode"];
    return [NSArray arrayWithObjects:name,pass,token,nil];
}


@end

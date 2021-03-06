//
//  HappySignupViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 3/6/14.
//
//

#import "HappySignupViewController.h"

#import <Parse/Parse.h>
#import <Social/Social.h>

#import "HappyStartViewController.h"

#import "HappyProfile.h"

@interface HappySignupViewController ()

@end

@implementation HappySignupViewController



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
    // Do any additional setup after loading the view from its nib.
    // Check if user is cached and linked to Facebook, if so, bypass login
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        [self passed];
    }
}
//***********************************************************
//
// SIGNING UP using Facebook
//
//***********************************************************
- (IBAction)facebookSignUpButtonClick:(id)sender
{

    NSArray *permissions = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    //Testing
     //PFUser *user = [PFUser user];
//    [PFUser logOut];
   // user = [PFUser user];
    [FBSession.activeSession close];
    [FBSession.activeSession closeAndClearTokenInformation];
    FBSession.activeSession = nil;
    
    [PFFacebookUtils logInWithPermissions:permissions block:^(PFUser *user, NSError *error) {
        if (!user)
        {
            if (!error) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
            
            NSString *message = @"The user cancelled the Facebook login.";
            UIAlertView *alert =
            [[UIAlertView alloc] initWithTitle:@"CANCELED"
                                       message:message
                                      delegate:self
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil];
            [alert show];
            }
            else {
                NSLog(@"Uh oh. An error occurred: %@", error);
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:[error description] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Dismiss", nil];
                [alert show];
            }
        }
        else if (user.isNew)
        {
            NSLog(@"User signed up and logged in through Facebook!");
            NSString *message = @"User signed up and logged in through Facebook!";
            UIAlertView *alert =
            [[UIAlertView alloc] initWithTitle:@"NEW USER"
                                       message:message
                                      delegate:self
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil];
            [alert show];
            self.profile = [[HappyProfile alloc] initWithType:@"Facebook New User"];
            [self facebookRequestUserProfile];
        }
        else
        {
            self.profile = [[HappyProfile alloc] initWithType:@"Facebook Existing User"];
            NSLog(@"User logged in through Facebook!");
            NSString *message = @"User logged in through Facebook!";
            UIAlertView *alert =
            [[UIAlertView alloc] initWithTitle:@"SUCCESS"
                                       message:message
                                      delegate:self
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil];
            [alert show];

            [self facebookRequestUserProfile];
            //[self passed];
        }
    }];
}

- (IBAction)twitterLoginButtonClick:(id)sender {
    //    [PFTwitterUtils initializeWithConsumerKey:@"yDHgblzLpcoFlgkX245oAwu45" consumerSecret:@"Kw6Ly9LvOFX0NFPWKc6Jd5g2IMx9ptrksJlOnThgLsJsMANRZa"];
    
    [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
        if (![PFTwitterUtils isLinkedWithUser:user]) {
            [PFTwitterUtils linkUser:user block:^(BOOL succeeded, NSError *error) {
                if ([PFTwitterUtils isLinkedWithUser:user]) {
                    NSLog(@"User logged in with Twitter!");
                }
            }];
        }
        if (user)
        {
            //
            // user exist in Parse
            //
            [self getTwitterAccount];
        }
        else if (user.isNew)
        {
        }
#ifdef DEBUG
        else
        {
            NSLog(@"Uh oh. The user cancelled the Twitter login.");
        }
#endif
    }];
}
- (IBAction)createNativeIBeHappyProfileButtonClick:(id)sender {
    _backButton.hidden = false;
    _createButton.hidden = false;
    _nonFBNameLabel.hidden = false;
    _nonFBNameTextfield.hidden = false;
    _nonFBPasswordLabel.hidden = false;
    _nonFBPasswordTextfield.hidden = false;
    _nonFBView.hidden = false;
}

- (IBAction)backAction:(id)sender {
    _backButton.hidden = true;
    _createButton.hidden = true;
    _nonFBNameLabel.hidden = true;
    _nonFBNameTextfield.hidden = true;
    _nonFBPasswordLabel.hidden = true;
    _nonFBPasswordTextfield.hidden = true;
    _nonFBView.hidden = true;
}
/////////////////////////////////////////////////////////////////
//
// Collect information about user
//
- (void)facebookRequestUserProfile
{
    if ([PFUser currentUser])
    {
        // Send request to Facebook
        FBRequest *request = [FBRequest requestForMe];
        [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error)
         {
             // handle response
             if (!error)
             {
                 // Parse the data received
                 NSDictionary *userData = (NSDictionary *)result;
                 
                 NSString *facebookID = userData[@"id"];
                 
                 NSMutableDictionary *userProfile = [NSMutableDictionary dictionaryWithCapacity:10];
                 
                 //self.profile = [[HappyProfile alloc] init];
                 
                 if (facebookID) {
                     userProfile[@"facebookId"] = facebookID;
                 }
                 else {
                     userProfile[@"facebookId"] = @"";
                 }
                 
                 if (userData[@"name"]) {
                     userProfile[@"name"] = userData[@"name"];
                     self.profile.name = userData[@"name"];
                     //self.welcomeMessageText.text = [NSString stringWithFormat:@"Welcome %@, We're creating your profile.", self.profile.name];
                 }
                 else {
                     userProfile[@"name"] = @"";
                 }
                 
                 if (userData[@"first_name"]) {
                     userProfile[@"first_name"] = userData[@"first_name"];
                     self.profile.name = userData[@"first_name"];
                     //self.welcomeMessageText.text = [NSString stringWithFormat:@"Welcome %@, We're creating your profile.", self.profile.name];
                 }
                 else {
                     userProfile[@"first_name"] = @"";
                 }
                 
                 if (userData[@"gender"]) {
                     userProfile[@"gender"] = userData[@"gender"];
                     self.profile.sex =  userProfile[@"gender"];
                 }
                 else {
                     userProfile[@"gender"] = @"";
                 }
                 
                 if (userData[@"last_name"]) {
                     userProfile[@"last_name"] = userData[@"last_name"];
                 }
                 else {
                     userProfile[@"last_name"] = @"";
                 }
                 
                 if (userData[@"email"]) {
                     userProfile[@"email"] = userData[@"email"];
                 }
                 else {
                     userProfile[@"email"] = @"";
                 }
                 
                 if (userData[@"location"][@"name"]) {
                     userProfile[@"location"] = userData[@"location"][@"name"];
                     self.profile.location = userProfile[@"location"];
                 }
                 else {
                     userProfile[@"location"] = @"";
                 }
                 
                 if (userData[@"birthday"])
                 {
                     // convert date from 02/19/1960 to February 19, 1960
                     NSDate *bday = nil;
                     
                     NSDateFormatter *oldDateFormat;
                     oldDateFormat = [[NSDateFormatter alloc] init];
                     [oldDateFormat setDateFormat:@"MM/d/yyyy"]; // e.g. 02/19/1960
                     
                     bday = [oldDateFormat dateFromString:userData[@"birthday"]];
                     
                     if (bday == nil) {
                         bday = [NSDate date];
                     }
                     
                     NSDateFormatter *newDateFormat;
                     newDateFormat = [[NSDateFormatter alloc] init];
                     [newDateFormat setDateFormat:@"MMMM d, yyyy"]; // e.g. February 19, 1960
                     
                     NSString *birthday = [newDateFormat stringFromDate:bday];
                     
                     self.profile.birthDay = bday;
                     userProfile[@"birthday"] = birthday;
                 }
                 else {
                     userProfile[@"birthday"] = @"";
                 }
                 
                 if (userData[@"relationship_status"])
                 {
                     self.profile.relation = userData[@"relationship_status"];
                     userProfile[@"relationship"] = userData[@"relationship_status"];
                 }
                 else
                 {
                     userProfile[@"relationship"] = @"";
                 }
                 
                 //
                 // get user profile picture
                 //
                 NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
                 
                 [self getProfileImageForURLString:pictureURL];
                 
                 if([pictureURL absoluteString])
                 {
                     userProfile[@"pictureURL"] = [pictureURL absoluteString];
                 }
                 
                 [[PFUser currentUser] setObject:userProfile forKey:@"profile"];
                 [[PFUser currentUser] saveInBackground];
                 [Utility archiveProfile:self.profile];
                 [self passed];
             }
             else if ([[[[error userInfo] objectForKey:@"error"] objectForKey:@"type"]
                       isEqualToString: @"OAuthException"]) { // Since the request failed, we can check if it was due to an invalid session
                 NSLog(@"The facebook session was invalidated");
                 //[self logoutButtonTouchHandler:nil];
             } else {
                 NSLog(@"Some other error: %@", error);
             }
         }];
    }
}

- (void) getProfileImageForURLString:(NSURL *)urlString
{
    //NSURL *url = [NSURL URLWithString:urlString];
    NSData *imageData = [NSData dataWithContentsOfURL:urlString];
    
    PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:imageData];
    
    [[PFUser currentUser] setObject:imageFile forKey:@"userPhoto"];
}

- (IBAction)editingBegin:(id)sender
{
    [self animateViewUp:YES];
}

- (IBAction)endPassword:(id)sender
{
    [self animateViewUp:NO];
}

- (IBAction)endEmail:(id)sender
{
    [self animateViewUp:NO];
}

- (void)animateViewUp:(BOOL)up
{
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

#pragma mark -
#pragma mark -hiding keyboard

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	
	return YES;
}

- (IBAction)start:(id)sender
{
    //
    // Create a screen for entering real email and password
    // Otherwise only one user would be saved.
    //
    NSString *email = _emailText.text;
    NSString *pass = _passText.text;
    
    // Create new user, it's so simple
    PFUser *user = [PFUser user];
    
    user.username = email;
    user.password = pass;
    //self.profile = [[HappyProfile alloc] init];
    // Signing up the new user to check if the user is not there already
    //
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error)
        {
            NSLog(@"New user signup for the first time");
            self.profile = [[HappyProfile alloc] initWithType:@"iBeHappy Native New User"];
            [self passed];
        }
        else
        {
            NSLog(@"User signup before we can try to login");
            
            //
            // User was there already so logging in with the email and password
            //
            [PFUser logInWithUsernameInBackground:email
                                         password:pass
                                            block:^(PFUser *user, NSError *error) {
                                                if (user)
                                                {
                                                    NSLog(@"User exists so we can continue");
            self.profile = [[HappyProfile alloc] initWithType:@"iBeHappy Native Existing User"];  
                                                    [self passed];
                                                }
                                                else
                                                {
                                                    NSLog(@"Could not login!!!");
                                                }
                                            }];
        }
    }];
    

}

- (void)passed
{
    //HappyProfile *profile = [Utility unarchiveProfile];
    if(self.profile != NULL && self.profile.profileCompleted)
    {
      HappyChallengeViewController *challengeViewController = [[HappyChallengeViewController alloc] initWithNibName:@"HappyChallengeViewController"
                                                                         bundle:nil];
        
        challengeViewController.profile = self.profile;
        [self presentViewController:challengeViewController animated:YES completion:nil];
        //challengeVC.profile = profile;
        challengeViewController = nil;
    }
    else
    {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *initViewController = [storyBoard instantiateInitialViewController];
    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:initViewController];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setEmailText:nil];
    [self setPassText:nil];
    [super viewDidUnload];
}




//////////////////////////////////////////////////////////////////////
//
// TWITTER
//
- (void)getTwitterAccount
{
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [accountStore
                                  accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
        if (granted) {
            NSArray *accounts = [accountStore accountsWithAccountType:accountType];
            // Check if the users has setup at least one Twitter account
            if (accounts.count > 0)
            {
                ACAccount *twitterAccount = [accounts objectAtIndex:0];
                
                NSURL *url =
                [NSURL URLWithString:@"https://api.twitter.com/1/users/show.json"];
                
                NSDictionary *params = @{@"screen_name" : twitterAccount.username};
                
                // Creating a request to get the info about a user on Twitter
                SLRequest *twitterInfoRequest =
                [SLRequest requestForServiceType:SLServiceTypeTwitter
                                   requestMethod:SLRequestMethodGET
                                             URL:url
                                      parameters:params];
                
                [twitterInfoRequest setAccount:twitterAccount];
                
                // Making the request
                [twitterInfoRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                    // Check if we reached the reate limit
                    if ([urlResponse statusCode] == 429) {
#ifdef DEBUG
                        NSLog(@"Rate limit reached");
#endif
                        return;
                    }
                    // Check if there was an error
                    if (error) {
#ifdef DEBUG
                        NSLog(@"Error: %@", error.localizedDescription);
#endif
                        return;
                    }
                    
                    // Check if there is some response data
                    if (responseData)
                    {
                        NSError *error = nil;
                        NSArray *TWData =
                        [NSJSONSerialization JSONObjectWithData:responseData
                                                        options:NSJSONReadingAllowFragments
                                                          error:&error];
                        // Filter the preferred data
                        NSString *screen_name = [(NSDictionary *)TWData objectForKey:@"screen_name"];
                        NSString *name = [(NSDictionary *)TWData objectForKey:@"name"];
                        
                        NSString *profileImageStringURL = [(NSDictionary *)TWData objectForKey:@"profile_image_url_https"];
                        
                        profileImageStringURL = [profileImageStringURL stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
                        [self getProfileImageForURLString:profileImageStringURL];
                        
                        if (screen_name) {
                            [PFUser currentUser][@"username"] = screen_name;
                        }
                        if (![PFUser currentUser][@"profile"])
                        {
                            [self createUserProfile];
                        }
                        if (name) {
                            [PFUser currentUser][@"profile"][@"name"] = name;
                            [PFUser currentUser][@"profile"][@"first_name"] = name;
                        }
                        
                        [[PFUser currentUser] save];
                        
                    }
                }];
            }
        }
        else
        {
            UIAlertView *alert =
            [[UIAlertView alloc] initWithTitle:@"No Twitter"
                                       message:@"Use Settings to set up Twitter"
                                      delegate:self
                             cancelButtonTitle:@"YES"
                             otherButtonTitles:nil];
            [alert show];
        }
    }];
}

- (void)createUserProfile
{
    if ([PFUser currentUser])
    {
        if (![PFUser currentUser][@"profile"])
        {
            NSMutableDictionary *userProfile = [NSMutableDictionary dictionaryWithCapacity:10];
            userProfile[@"facebookId"] =    @"";
            userProfile[@"name"] =          @"";
            userProfile[@"first_name"] =    @"";
            userProfile[@"gender"] =        @"";
            userProfile[@"last_name"] =     @"";
            userProfile[@"email"] =         @"";
            userProfile[@"location"] =      @"";
            userProfile[@"relationship"] =  @"";
            userProfile[@"pictureURL"] =    @"";
            [[PFUser currentUser] setObject:userProfile forKey:@"profile"];
            [[PFUser currentUser] saveInBackground];
        }
    }
}


@end

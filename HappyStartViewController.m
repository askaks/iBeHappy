 //
//  HappyStartViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappyStartViewController.h"
#import <Parse/Parse.h>
#import <math.h>

@interface HappyStartViewController ()

@end

@implementation HappyStartViewController

@synthesize profile;
@synthesize viewVC;

@synthesize bioVC;
@synthesize homeVC;
@synthesize remVC;
@synthesize scoreVC;
@synthesize challengeVC;

@synthesize ProfileTab;

@synthesize AfirstText;
@synthesize BnextText;
@synthesize CchallengePerDayText;
@synthesize EbutterflyText;
@synthesize DdoYourBestText;
@synthesize FreadyGoText;
@synthesize goButton;
@synthesize helpButton;
@synthesize startExplanationButton;
@synthesize popUpBackground;
//@synthesize initialText;

@synthesize AtoBButton;
@synthesize BtoCButton;
@synthesize CtoDButton;
@synthesize DtoEButton;
@synthesize EtoFButton;
@synthesize EPart2ButterflyText;
@synthesize EtoEPart2Button;

- (IBAction)Home:(id)sender
{
	if (nil == homeVC) {
		homeVC = [[HappyHomeViewController alloc] initWithNibName:@"HappyHomeViewController"
                                                           bundle:nil];
	}
	
    homeVC.profile = profile;
    
	// viewDidLoad will be called
	//[self presentModalViewController:homeVC animated:YES];
	
	self.homeVC = nil;
}

- (IBAction)Score:(id)sender
{
	if (nil == scoreVC) {
		scoreVC = [[HappyScoreViewController alloc] initWithNibName:@"HappyScoreViewController"
                                                             bundle:nil];
	}
	
	// viewDidLoad will be called
	//[self presentModalViewController:scoreVC animated:YES];
	
	self.scoreVC = nil;
}

- (IBAction)Challenge:(id)sender
{
	if (nil == challengeVC) {
		challengeVC = [[HappyChallengeViewController alloc] initWithNibName:@"HappyChallengeViewController"
                                                                     bundle:nil];
	}
    
    challengeVC.profile = profile;
	
	// viewDidLoad will be called
	//[self presentModalViewController:challengeVC animated:YES];
	
	self.challengeVC = nil;
}

- (IBAction)Reminders:(id)sender
{
	if (nil == remVC) {
		remVC = [[HappyRemindersViewController alloc] initWithNibName:@"HappyRemindersViewController"
                                                               bundle:nil];
	}
	
    remVC.profile = profile;
    
	// viewDidLoad will be called
	//[self presentModalViewController:remVC animated:YES];
	
	self.remVC = nil;
}

- (IBAction)Explain:(id)sender {
    popUpBackground.hidden = false;
    helpButton.hidden = true;
    goButton.hidden = true;
    startExplanationButton.hidden = true;
    //initialText.hidden = true;
    
    AfirstText.hidden = false;
    BnextText.hidden = true;
    CchallengePerDayText.hidden = true;
    EbutterflyText.hidden = true;
    DdoYourBestText.hidden = true;
    EPart2ButterflyText.hidden = true;
    FreadyGoText.hidden = true;
    AtoBButton.hidden = false;
    BtoCButton.hidden = true;
    CtoDButton.hidden = true;
    DtoEButton.hidden = true;
    EtoEPart2Button.hidden = true;
    EtoFButton.hidden = true;
    
}

- (IBAction)AToBAction:(id)sender {
    AfirstText.hidden = true;
    BnextText.hidden = false;
    CchallengePerDayText.hidden = true;
    EbutterflyText.hidden = true;
    EPart2ButterflyText.hidden  = true;
    DdoYourBestText.hidden = true;
    FreadyGoText.hidden = true;
    AtoBButton.hidden = true;
    BtoCButton.hidden = false;
    CtoDButton.hidden = true;
    DtoEButton.hidden = true;
    EtoEPart2Button.hidden = true;
    EtoFButton.hidden = true;
}

- (IBAction)BToCAction:(id)sender {
    AfirstText.hidden = true;
    BnextText.hidden = true;
    CchallengePerDayText.hidden = false;
    EbutterflyText.hidden = true;
    EPart2ButterflyText.hidden  = true;
    DdoYourBestText.hidden = true;
    FreadyGoText.hidden = true;
    AtoBButton.hidden = true;
    BtoCButton.hidden = true;
    CtoDButton.hidden = false;
    DtoEButton.hidden = true;
    EtoEPart2Button.hidden = true;
    EtoFButton.hidden = true;
}

- (IBAction)CToDAction:(id)sender {
    AfirstText.hidden = true;
    BnextText.hidden = true;
    CchallengePerDayText.hidden = true;
    EbutterflyText.hidden = true;
    EPart2ButterflyText.hidden  = true;
    DdoYourBestText.hidden = false;
    FreadyGoText.hidden = true;
    AtoBButton.hidden = true;
    BtoCButton.hidden = true;
    CtoDButton.hidden = true;
    DtoEButton.hidden = false;
    EtoEPart2Button.hidden = true;
    EtoFButton.hidden = true;
}

- (IBAction)DtoEAction:(id)sender {
    AfirstText.hidden = true;
    BnextText.hidden = true;
    CchallengePerDayText.hidden = true;
    EbutterflyText.hidden = false;
    EPart2ButterflyText.hidden  = true;
    DdoYourBestText.hidden = true;
    FreadyGoText.hidden = true;
    AtoBButton.hidden = true;
    BtoCButton.hidden = true;
    CtoDButton.hidden = true;
    DtoEButton.hidden = true;
    EtoEPart2Button.hidden = false;
    EtoFButton.hidden = true;
}

- (IBAction)EToFAction:(id)sender {
    AfirstText.hidden = true;
    BnextText.hidden = true;
    CchallengePerDayText.hidden = true;
    EbutterflyText.hidden = true;
    EPart2ButterflyText.hidden  = true;
    DdoYourBestText.hidden = true;
    FreadyGoText.hidden = false;
    AtoBButton.hidden = true;
    BtoCButton.hidden = true;
    CtoDButton.hidden = true;
    DtoEButton.hidden = true;
    EtoEPart2Button.hidden = true;
    EtoFButton.hidden = true;
    goButton.hidden = false;
}

- (IBAction)EtoEPart2Action:(id)sender {
    AfirstText.hidden = true;
    BnextText.hidden = true;
    CchallengePerDayText.hidden = true;
    EbutterflyText.hidden = true;
    EPart2ButterflyText.hidden  = false;
    DdoYourBestText.hidden = true;
    FreadyGoText.hidden = true;
    AtoBButton.hidden = true;
    BtoCButton.hidden = true;
    CtoDButton.hidden = true;
    DtoEButton.hidden = true;
    EtoEPart2Button.hidden = true;
    EtoFButton.hidden = false;
}

- (IBAction)logoutButtonTouchHandler:(id)sender {
    // Logout user, this automatically clears the cache
    [PFUser logOut];
    
    // Return to login view controller
    HappySignupViewController *signInVC = [[HappySignupViewController alloc] initWithNibName:@"HappySignupViewController"
                                                                                      bundle:nil];
    
    signInVC.signupWelcomeMessageText.text = @"You've been successfuully logged out.  Please relogin to Facebook or create a new profile to continue.";
    
	// viewDidLoad will be called
	//[self presentModalViewController:signInVC animated:YES];
}

#pragma mark -
#pragma mark -prepare for segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    if (profile.relation && ![profile.relation isEqualToString:@""]) {
        if (![self.happyOptions.loveOptions containsObject:profile.relation]) {
            [ self.happyOptions.loveOptions addObject:(profile.relation)];
            
            PFObject *addToParse = [PFObject objectWithClassName:@"Options"];
            addToParse[@"loveOptions"] =  profile.relation;
            addToParse[@"childOptions"] = @"N/A";
            addToParse[@"educationOptions"] = @"N/A";
            addToParse[@"incomeOptions"] = @"N/A";
            addToParse[@"loveSatisfactionOptions"] = @"N/A";
            addToParse[@"partnerOptions"] = @"N/A";
            addToParse[@"petOptions"] = @"N/A";
            addToParse[@"schoolSatisfactionOptions"] = @"N/A";
            addToParse[@"sexOptions"] = @"N/A";
            addToParse[@"workSatisfactionOptions"] = @"N/A";
            [addToParse saveEventually:^(BOOL succeeded, NSError *error) {
                
            }];
        }
    }
    if ([segue.identifier isEqualToString:@"ToBio"])
    {
        bioVC = [segue destinationViewController];
        bioVC.profile = self.profile;
        bioVC.happyOptions = self.happyOptions;
    }
    else if ([segue.identifier isEqualToString:@"ToHelp"])
    {
        
    }
    else
    {
        viewVC = [segue destinationViewController];
        viewVC.profile = self.profile;
        viewVC.happyOptions = self.happyOptions;
    }
}

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
    profile = [Utility unarchiveProfile];
    if(profile != NULL && ![profile.name isEqualToString:@""])
    {
        _welcomeMessageText.text = [NSString stringWithFormat:@"You haven't completed your profile yet, %@!", profile.name];
    }
    if(profile == NULL || !profile.profileCompleted)
    {
        [self facebookRequestUserProfile];
    }
    else
    {
        if (nil == homeVC) {
            homeVC = [[HappyHomeViewController alloc] initWithNibName:@"HappyHomeViewController"
                                                                         bundle:nil];
        }
        
        homeVC.profile = profile;
        
        // viewDidLoad will be called
        [self presentViewController:homeVC animated:NO completion:nil];
        //challengeVC.profile = profile;
        self.homeVC = nil;
    }

    self.happyOptions = [[HappyOptions alloc] init];
    
     PFQuery *educationQuery = [PFQuery queryWithClassName:@"Options"];
     [educationQuery selectKeys:@[@"educationOptions"]];
     [educationQuery whereKey:@"educationOptions" notEqualTo:@"N/A"];
     [educationQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
      {
          if (!error)
          {
              for (PFObject *obj in objects)
              {
                  NSString *eduOps = obj[@"educationOptions"];
                  eduOps = [eduOps stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                  if(![eduOps isEqualToString:@""])
                  [ self.happyOptions.educationOptions addObject:(eduOps)];
              }
          }
          // The find succeeded. The first 100 objects are available in object
          else
          {
              // Log details of the failure
              NSLog(@"Error: %@ %@", error, [error userInfo]);
          }
      }];
     
    //Get Love Options
    PFQuery *loveQuery = [PFQuery queryWithClassName:@"Options"];
    [loveQuery selectKeys:@[@"loveOptions"]];
    [loveQuery whereKey:@"loveOptions" notEqualTo:@"N/A"];
    //[loveQuery whereKey:@"loveOptions" notEqualTo:@" "];
     [loveQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
      {
          if (!error)
          {
              for (PFObject *obj in objects)
              {
                  NSString *loveOps = obj[@"loveOptions"];
                  
                    loveOps = [loveOps stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                  if(![loveOps isEqualToString:@""])
                  [ self.happyOptions.loveOptions addObject:(loveOps)];
              }
          }
          // The find succeeded. The first 100 objects are available in object
          else
          {
              // Log details of the failure
              NSLog(@"Error: %@ %@", error, [error userInfo]);
          }
      }];
    
     PFQuery *incomeQuery = [PFQuery queryWithClassName:@"Options"];
     [incomeQuery selectKeys:@[@"incomeOptions"]];
     [incomeQuery whereKey:@"incomeOptions" notEqualTo:@"N/A"];
     [incomeQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
      {
          if (!error)
          {
              for (PFObject *obj in objects)
              {
                  NSString *incomeOps = obj[@"incomeOptions"];
                  incomeOps = [incomeOps stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                  if(![incomeOps isEqualToString:@""])
                  [ self.happyOptions.incomeOptions addObject:(incomeOps)];
              }
          }
          // The find succeeded. The first 100 objects are available in object
          else
          {
              // Log details of the failure
              NSLog(@"Error: %@ %@", error, [error userInfo]);
          }
      }];
     
     PFQuery *childQuery = [PFQuery queryWithClassName:@"Options"];
     [childQuery selectKeys:@[@"childOptions"]];
     [childQuery whereKey:@"childOptions" notEqualTo:@"N/A"];
     [childQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
      {
          if (!error)
          {
              for (PFObject *obj in objects)
              {
                  NSString *childOps = obj[@"childOptions"];
                  childOps = [childOps stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                  if(![childOps isEqualToString:@""])
                  [ self.happyOptions.childOptions addObject:(childOps)];
              }
          }
          else
          {
              NSLog(@"Error: %@ %@", error, [error userInfo]);
          }
      }];
     
     PFQuery *petQuery = [PFQuery queryWithClassName:@"Options"];
     [petQuery selectKeys:@[@"petOptions"]];
     [petQuery whereKey:@"petOptions" notEqualTo:@"N/A"];
     [petQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
      {
          if (error)
          {
              // Log details of the failure
              NSLog(@"Error: %@ %@", error, [error userInfo]);
          }
          else
          {
              for (PFObject *obj in objects)
              {
                  NSString *petOps = obj[@"petOptions"];
                  petOps = [petOps stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                  if(![petOps isEqualToString:@""])
                  [ self.happyOptions.petOptions addObject:(petOps)];
              }
          }
          // The find succeeded. The first 100 objects are available in object
      }];
}

- (void)viewDidUnload
{
    [self setProfileTab:nil];
    [self setAfirstText:nil];
    [self setBnextText:nil];
    [self setCchallengePerDayText:nil];
    [self setDdoYourBestText:nil];
    [self setEbutterflyText:nil];
    [self setFreadyGoText:nil];
    [self setPopUpBackground:nil];
    [self setStartExplanationButton:nil];
    [self setHelpButton:nil];
    [self setGoButton:nil];
    [self setAtoBButton:nil];
    [self setBtoCButton:nil];
    [self setCtoDButton:nil];
    [self setDtoEButton:nil];
    [self setEtoFButton:nil];
    //[self setInitialText:nil];
    [self setEPart2ButterflyText:nil];
    [self setEtoEPart2Button:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)EtoEPart2Button:(id)sender {
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
                 
                 if (facebookID) {
                     userProfile[@"facebookId"] = facebookID;
                 }
                 else {
                     userProfile[@"facebookId"] = @"";
                 }
                 
                 if (userData[@"name"]) {
                     userProfile[@"name"] = userData[@"name"];
                     profile.name = userData[@"name"];
                     self.welcomeMessageText.text = [NSString stringWithFormat:@"Welcome %@, We're creating your profile.", profile.name];
                 }
                 else {
                     userProfile[@"name"] = @"";
                 }
                 
                 if (userData[@"first_name"]) {
                     userProfile[@"first_name"] = userData[@"first_name"];
                     profile.name = userData[@"first_name"];
                     self.welcomeMessageText.text = [NSString stringWithFormat:@"Welcome %@, We're creating your profile.", profile.name];
                 }
                 else {
                     userProfile[@"first_name"] = @"";
                 }
                 
                 if (userData[@"gender"]) {
                     userProfile[@"gender"] = userData[@"gender"];
                     profile.sex =  userProfile[@"gender"];
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
                     profile.location = userProfile[@"location"];
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
                     
                     profile.birthDay = bday;
                     userProfile[@"birthday"] = birthday;
                 }
                 else {
                     userProfile[@"birthday"] = @"";
                 }
                 
                 if (userData[@"relationship_status"])
                 {
                     profile.relation = userData[@"relationship_status"];
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
                 
             }
         else if ([[[[error userInfo] objectForKey:@"error"] objectForKey:@"type"]
                     isEqualToString: @"OAuthException"]) { // Since the request failed, we can check if it was due to an invalid session
             NSLog(@"The facebook session was invalidated");
             [self logoutButtonTouchHandler:nil];
         } else {
             NSLog(@"Some other error: %@", error);
         }
         }];
    }
    [self userFromFacebookText];
}

- (void) getProfileImageForURLString:(NSURL *)urlString
{
    //NSURL *url = [NSURL URLWithString:urlString];
    NSData *imageData = [NSData dataWithContentsOfURL:urlString];
    
    PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:imageData];
    
    [[PFUser currentUser] setObject:imageFile forKey:@"userPhoto"];
}
- (void)userFromFacebookText
    {
        popUpBackground.hidden = false;
        AfirstText.hidden = true;
        BnextText.hidden = true;
        CchallengePerDayText.hidden = true;
        EbutterflyText.hidden = true;
        EPart2ButterflyText.hidden  = true;
        DdoYourBestText.hidden = true;
        FreadyGoText.hidden = false;
        if([profile.name isEqual:@"No Profile Created"])
        {
            FreadyGoText.text =[NSString stringWithFormat:@"Welcome, we've successfully loaded most of your information from Facebook.  Please go through and verify that the information is correct and add any additional information needed."];
        }
        else
        {
            FreadyGoText.text =[NSString stringWithFormat:@"Welcome %@, we've successfully loaded most of your information from Facebook.  Please go through and verify that the information is correct and add any additional information needed.", profile.name];
        }
        AtoBButton.hidden = true;
        BtoCButton.hidden = true;
        CtoDButton.hidden = true;
        DtoEButton.hidden = true;
        EtoEPart2Button.hidden = true;
        EtoFButton.hidden = true;
        goButton.hidden = false;
        startExplanationButton.hidden = true;
        helpButton.hidden = true;
        [FreadyGoText sizeToFit];
        [popUpBackground sizeThatFits:FreadyGoText.contentSize];
    }
@end

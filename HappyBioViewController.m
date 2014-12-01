//
//  HappyBioViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappyBioViewController.h"

#import <Parse/Parse.h>

#import "HappyOptions.h"

@interface HappyBioViewController ()

@end

@implementation HappyBioViewController

@synthesize profile;
@synthesize startVC;
@synthesize statusVC;

@synthesize nameText;
@synthesize sexChoice;
@synthesize happinessRatingText;

@synthesize homeVC;
@synthesize scoreVC;
@synthesize challengeVC;
@synthesize remVC;

@synthesize changeDateVC;
@synthesize dateBtn;
@synthesize interestedInChoice;


- (IBAction)Home:(id)sender
{
	if (nil == homeVC) {
		homeVC = [[HappyHomeViewController alloc] initWithNibName:@"HappyHomeViewController"
                                                           bundle:nil];
	}
	
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
	
	// viewDidLoad will be called
	//[self presentModalViewController:remVC animated:YES];
	
	self.remVC = nil;
}

-(IBAction)changeDate {
    
	if (nil == changeDateVC) {
		changeDateVC = [[ChangeDateViewController alloc]
            initWithNibName:@"ChangeDateViewController"
                                                               bundle:nil];
	}
	
	//[self presentModalViewController:changeDateVC animated:YES];
	
	[changeDateVC setDate:dateBtn profile:profile];
    
    self.changeDateVC = nil;
}

- (IBAction)doneAction:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Profile Complete?"
                                                    message:@"Save profile and proceed to your first challenge?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles: @"Continue",nil];
    [alert show];
    
}
-(void)alertView:(UIAlertView*)alert didDismissWithButtonIndex:(NSInteger)buttonIndex;
{
    NSLog(@">>> Entering %s <<<", __PRETTY_FUNCTION__);
    
    NSString *title = [alert buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"Continue"])
    {
        [Utility archiveProfile:profile];
        if (nil == challengeVC) {
            challengeVC = [[HappyChallengeViewController alloc] initWithNibName:@"HappyChallengeViewController"
                                                                         bundle:nil];
        }
        
        challengeVC.profile = profile;
        
        // viewDidLoad will be called
        //[self presentModalViewController:challengeVC animated:YES];
        
        self.challengeVC = nil;
    }
}

#pragma mark -
#pragma mark -hiding keyboard

-(BOOL)textFieldShouldReturn:(UITextField *)textField 
{
	[textField resignFirstResponder];
	
	return YES;
}

#pragma mark -
#pragma mark -prepare for segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    //
    // Example of using Parse. Saving name into Parse.
    //
    [PFUser currentUser][@"name"] = nameText.text;
    [[PFUser currentUser] saveInBackground];

    profile.name = nameText.text;
    
    assert(profile.birthDay);
    
    
    NSDate *now = [[NSDate alloc] init];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [gregorianCalendar components: (NSYearCalendarUnit )
                                                        fromDate:profile.birthDay
                                                          toDate:now                                                         options:nil];
    NSInteger currentAge = [components year];
    
    profile.age = currentAge;
    
//    if (sexChoice.selectedSegmentIndex == 0) {
//        profile.sex = @"female";
//        [PFUser currentUser][@"male"] = @NO;
//    }
//    else {
//        profile.sex = @"male";
//        [PFUser currentUser][@"male"] = @YES;
//    }
//
//    if (interestedInChoice.selectedSegmentIndex == 0) {
//        profile.seeking = @"females";
//        [PFUser currentUser][@"atractFemale"] = @YES;
//    }
//    else {
//        profile.seeking = @"males";
//        [PFUser currentUser][@"atractFemale"] = @NO;
//    }
    
    //
    // save user in the background
    //
    [[PFUser currentUser] saveInBackground];
    
    if ([segue.identifier isEqualToString:@"ToStatus"])
    {
        statusVC = [segue destinationViewController];
        statusVC.profile = self.profile;
        statusVC.happyOptions = self.happyOptions;
    }
    else {
        startVC = [segue destinationViewController];
        startVC.profile = self.profile;
        statusVC.happyOptions = self.happyOptions;
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    // Example of using Parse. Column <name> type string was created in Parse.
    //
    
    //self.profilePhotoImage.image = [PFUser currentUser][@"userImage"];
    
    // Download the user's facebook profile picture
    self.imageData = [[NSMutableData alloc] init]; // the data will be loaded in here
    
    if ([[PFUser currentUser] objectForKey:@"profile"][@"pictureURL"]) {
        NSURL *pictureURL = [NSURL URLWithString:[[PFUser currentUser] objectForKey:@"profile"][@"pictureURL"]];
        
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:pictureURL
                                                                  cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                              timeoutInterval:2.0f];
        // Run network request asynchronously
        NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
        if (!urlConnection) {
            NSLog(@"Failed to download picture");
        }
    }
//    PFFile *imageFile = nil;
//    
//    if ([PFUser currentUser][@"userPhoto"]) {
//        imageFile = [PFUser currentUser][@"userPhoto"];
//        if (imageFile)
//        {
//            NSData *imageData = [imageFile getData];
//            UIImage *picture = [UIImage imageWithData:imageData];
//            if (picture)
//            {
//                [self.profilePhotoImage setImage:picture];
//            }
//        }
//    }
    
    _dateFormat = [[NSDateFormatter alloc] init];
	[_dateFormat setDateFormat:@"MMMM d, yyyy"];
    nameText.text = profile.name;
    
    if([profile.sex isEqualToString:@"female"])
    {
        sexChoice.selectedSegmentIndex = 0; //user is female
        //Going to assume opposite sex attraction:
        profile.seeking = @"male";
        interestedInChoice.selectedSegmentIndex = 1;
        //[interestedInChoice sendActionsForControlEvents:UIControlEventValueChanged];
    }
    else
    {
        sexChoice.selectedSegmentIndex = 1; //user is male
        //Going to assume opposite sex attraction:
        profile.seeking = @"female";
        interestedInChoice.selectedSegmentIndex = 0;
        //[interestedInChoice sendActionsForControlEvents:UIControlEventValueChanged];
    }
    
    
    //int attraction = 0; // you forgot about it!!!!
//    if ([PFUser currentUser][@"atractFemale"]) {
//        if ([[PFUser currentUser][@"atractFemale"] boolValue]) {
//            attraction = 0;
//        }
//        else {
//            attraction = 1;
//        }
//    }
    
    //assume interested in opposite sex
   // interestedInChoice.selectedSegmentIndex = sexChoice.selectedSegmentIndex % 1;
    
    // birthday
    NSDate *birthday = profile.birthDay;
    
    if ([PFUser currentUser][@"DOB"]) {
        birthday = [PFUser currentUser][@"DOB"];
    }
    
    NSString *bday = [_dateFormat stringFromDate:birthday];
    
    if ([bday isEqual:@""]) {
        NSDate *now = [[NSDate alloc] init];
        bday = [_dateFormat stringFromDate:now];
    }
    
	[dateBtn setTitle:bday forState:0];
    
    self.locationLabel.text = [NSString stringWithFormat:@"From %@", profile.location];
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        profile = [Utility unarchiveProfile];
    }
    return self;
}
- (void)viewDidUnload
{
//    [self setAgeText:nil];
    [self setNameText:nil];
    [self setSexChoice:nil];
    [self setDateBtn:nil];
    [self setHappinessRatingText:nil];
    [self setInterestedInChoice:nil];
    [self setDoneButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
#pragma mark - NSURLConnectionDataDelegate

/* Callback delegate methods used for downloading the user's profile picture */

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // As chuncks of the image are received, we build our data file
    [self.imageData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // All data has been downloaded, now we can set the image in the header image view
    self.profilePhotoImage.image = [UIImage imageWithData:self.imageData];
    
    // Add a nice corner radius to the image
    self.profilePhotoImage.layer.cornerRadius = 8.0f;
    self.profilePhotoImage.layer.masksToBounds = YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

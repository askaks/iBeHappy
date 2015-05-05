//
//  HappyHomeViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappyHomeViewController.h"
#import <Parse/Parse.h>

@interface HappyHomeViewController ()

@end

@implementation HappyHomeViewController

@synthesize profile;
//@synthesize nameText;
//@synthesize happyChallengeText;

@synthesize viewController;
@synthesize bioVC;
@synthesize remVC;
@synthesize scoreVC;
@synthesize challengeVC;
@synthesize helpVC;
@synthesize nextLevelButton;

@synthesize startOver;



#pragma mark - ViewController Loading

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
    
    if(profile == nil)
    {
        [self doBasicUISetup:newUser];
    }
    else
    {
//        if(some condition signifying all challenges completed)
//        {
//            [self doBasicUISetup:done];
//        }
        if(profile.numOfCompletedChallenges <= 0)
        {
            [self doBasicUISetup:noChallengesCompleted];
        }
        else if (profile.numOfCompletedChallenges == 1)
        {
            [self doBasicUISetup:oneChallengeCompleted];
        }
        else
        {
            [self doBasicUISetup:someChallengesCompleted];
        }
    }

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidUnload
{
    [self setHelloUserText:nil];
    [self setHappinessRatingLabel:nil];
    [self setStartOverButton:nil];
    [self setUpdateProfileButton:nil];
    [self setNextLevelButton:nil];
    [self setRestartButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UI Setup
- (void)doBasicUISetup: (enum status) currentStatus
{
    if(currentStatus == newUser)
    {
        self.helloUserText.text = @"Hello...  Click START to create a profile and get started!";
        //[self.startOverButton setTitle:@"Start" forState:UIControlStateNormal];
        self.startOverButton.enabled = true;
        self.startOverButton.userInteractionEnabled = true;
        self.updateProfileButton.enabled = false;
        self.updateProfileButton.titleLabel.textColor = [UIColor grayColor];
        //self.updateProfileButton.titleLabel.backgroundColor = [UIColor grayColor];
        self.restartButton.enabled = false;
        self.restartButton.titleLabel.textColor = [UIColor grayColor];
        //self.restartButton.titleLabel.backgroundColor = [UIColor grayColor];
        self.nextLevelButton.enabled = false;
        self.nextLevelButton.titleLabel.textColor = [UIColor grayColor];
    }
    //@property enum status {newUser, noChallengesCompleted,oneChallengeCompleted, someChallengesCompleted, done, problem};
    
    else if (currentStatus == noChallengesCompleted) {
        if(![profile.name isEqualToString:@""])
        {
            self.helloUserText.text = [NSString stringWithFormat:@"%@, you haven't completed any of your %zd challenges loaded.", profile.name, profile.challenges.count];
        }
        else
        {
            self.helloUserText.text = [NSString stringWithFormat:@"You haven't completed any of your %d challenges loaded.", profile.challenges.count];
        }
    }
    else if (currentStatus == oneChallengeCompleted) {
        if(![profile.name isEqualToString:@""])
        {
            self.helloUserText.text = [NSString stringWithFormat:@"%@, so far you have completed one challenge out of %d viewed, out of your %d challenges loaded.", profile.name, profile.numOfViewedChallenges, profile.challenges.count];
        }
        else
        {
            self.helloUserText.text = [NSString stringWithFormat:@"So far you have completed one challenge out of %d viewed, out of your %d challenges loaded.", profile.numOfViewedChallenges, profile.challenges.count];
        }
    }
    else if (currentStatus == someChallengesCompleted) {
        if(![profile.name isEqualToString:@""])
        {
            self.helloUserText.text = [NSString stringWithFormat:@"%@, so far you have completed %d challenges out of %d viewed, out of your %d challenges loaded.", profile.name, profile.numOfCompletedChallenges, profile.numOfViewedChallenges, profile.challenges.count];
        }
        else
        {
            self.helloUserText.text = [NSString stringWithFormat:@"So far you have completed %d challenges out of %d viewed, out of your %d challenges loaded.", profile.numOfCompletedChallenges, profile.numOfViewedChallenges,profile.challenges.count];
        }
    }
    else if (currentStatus == done) {
        if(![profile.name isEqualToString:@""])
        {
            self.helloUserText.text = [NSString stringWithFormat:@"%@, you have finished your first set of iBeHappy Challenges, completing %d challenges out of %d possible Challenges.  Hit Next Level to see what new challenges are available.", profile.name, profile.numOfCompletedChallenges, profile.numOfViewedChallenges];
        }
        else
        {
            self.helloUserText.text = [NSString stringWithFormat:@"You have finished your first set of iBeHappy Challenges, completing %d challenges out of %d possible Challenges.  Hit Next Level to see what new challenges are available.", profile.numOfCompletedChallenges, profile.numOfViewedChallenges];
        }
        self.nextLevelButton.enabled = true;
        self.nextLevelButton.titleLabel.textColor = [UIColor greenColor];
    }
}

#pragma mark - Actions

- (IBAction)StartingOver:(id)sender
{

    NSString *startOverTitle = @"Start Over";
    NSString *startOverMessage = @"Are you sure you want to quit your current iBeHappy and start over?  Your profile and settings will be deleted.";
    
    if(profile == nil || [profile.name isEqual:@"No Profile Created"])
    {
        startOverTitle = @"Create Profile";
        startOverMessage = @"Creating a profile will help iBeHappy pick out the best challenges for you";
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:startOverTitle
                                                    message:startOverMessage
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles: @"Ok",nil];
    [alert show];
}

- (IBAction)UpdateProfile:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Update Profile"
                                                    message:@"You are about to make changes to your profile.  Updating your profile will reload your challenges   Are you sure you want to reload challenges?"
                          delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles: @"Continue",nil];
    [alert show];
}

- (IBAction)JumpToNextLevel:(id)sender {
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Next Level"
                                                    message:@"You are about to move to the next level. " 
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles: @"Continue To Next Level",nil];
    [alert show];
    profile.level++;
}
- (IBAction)RestartChallengesAction:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Restart Challenges?"
                                                    message:@"Would you like to restart your challenges?  Your compeleted challenges will be deleted and your customized challenge list will be reloaded."
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles: @"Restart",nil];
    [alert show];
}

//This function is called as soon as user selects a button on a UIAlertView
-(void)alertView:(UIAlertView*)alert didDismissWithButtonIndex:(NSInteger)buttonIndex;
{
    //Title of button pressed:
    NSString *title = [alert buttonTitleAtIndex:buttonIndex];
    
    //"Ok" appears on Start/Start Over Button UIAlertView
    if ([title isEqualToString:@"Ok"]) {
        
        PFUser *currentUser = [PFUser currentUser];
        [currentUser delete];
        NSString *filePath =  [Utility profilePath];
        
        NSError *error = nil;
        NSDictionary *attrib;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //
        // check if file already exist
        //
        BOOL exist = [fileManager fileExistsAtPath:filePath];
        BOOL success = YES;
        if (YES == exist)
        {
            // UNLOCK THE FILE
            attrib = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                 forKey:NSFileImmutable];
            
            success = [fileManager setAttributes:attrib
                                    ofItemAtPath:filePath
                                           error:&error];
        }
        if (YES == success)
        {
            success = [fileManager removeItemAtPath:filePath error:nil];
            
            if (NO == success) {
                NSLog(@"Error: %@",[error localizedDescription]);
            }
        }
        else {
            NSLog(@"Could not UNLOCK the file.");
        }        
        
        
        if(profile == nil)
        {
            [self start];
        }
        else
        {
            [self startover];
        }
    }
    
    else if ([title isEqualToString:@"Continue"]) {
        [self UpdateProfile];
    }
    else if ([title isEqualToString:@"Continue To Next Level"]) {
        [profile restartChallenges];
        // viewDidLoad will be called
        [self presentViewController:challengeVC animated:YES completion:nil];
        self.challengeVC = nil;
    }
    
    else if ([title isEqualToString:@"Restart"]) {
        [profile restartChallenges];
        // viewDidLoad will be called
        if (nil == challengeVC) {
            challengeVC = [[HappyChallengeViewController alloc] initWithNibName:@"HappyChallengeViewController"
                                                                         bundle:nil];
        }
        challengeVC.profile = profile;
        [self presentViewController:challengeVC animated:NO completion:nil];
        self.challengeVC = nil;
    }

}

-(void)start
{
    self.startOver = true;
    
    HappySignupViewController *happySignupViewController = [[HappySignupViewController alloc]  initWithNibName:@"HappySignupViewController" bundle:nil];
    [self presentViewController:happySignupViewController animated:YES completion:nil];
    //self.happySignupViewController = nil;
}

-(void)startover
{
    self.startOver = true;
    //SAME AS START
    HappySignupViewController *happySignupViewController = [[HappySignupViewController alloc]  initWithNibName:@"HappySignupViewController" bundle:nil];
    [self presentViewController:happySignupViewController animated:YES completion:nil];
    
    
    //    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
//    UINavigationController *navig = [storyboard instantiateViewControllerWithIdentifier:@"705"];
//	// viewDidLoad will be called
//	[self presentViewController:(UIViewController *)navig animated:YES completion:^{[self animationCompleted];}];
}


-(void)UpdateProfile
{
    profile.challenges = [[NSMutableArray alloc] init];
    
    //About to go and make changes to profile!
    profile.profileCompleted = false;
    [Utility archiveProfile:profile];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
	
    UINavigationController *navig = [storyboard instantiateViewControllerWithIdentifier:@"705"];
	
	[self presentViewController:(UIViewController *)navig animated:YES completion:^{[self UpdateProfileAnimationCompleted];}];
    
    
    //NSLog(@"<<< Leaving %s >>>", __PRETTY_FUNCTION__);
}

-(void)animationCompleted{
    
    // Whatever you want to do after finish animation
    //[self dismissModalViewControllerAnimated:true];
    //NSLog(@"Animation Completed");
    
}
-(void)UpdateProfileAnimationCompleted{
    
    // Whatever you want to do after finish animation
    //profile.challenges = [[NSMutableArray alloc] init];
    //[Utility archiveProfile:profile];
    //NSLog(@"UpdateProfileAnimationCompleted Completed");
    
}




#pragma mark -
#pragma mark -hiding keyboard

-(BOOL)textFieldShouldReturn:(UITextField *)textField 
{
	[textField resignFirstResponder];
	
	return YES;
}







#pragma mark - View Controllers
- (IBAction)Profile:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    if (nil == bioVC) {
        bioVC = [storyboard instantiateViewControllerWithIdentifier:@"505"];
    }
    
    bioVC.profile = profile;
    
    // viewDidLoad will be called
    [self presentViewController:(UIViewController *)bioVC animated:YES completion:nil];
    
    self.bioVC = nil;
}

- (IBAction)Score:(id)sender
{
    if (nil == scoreVC) {
        scoreVC = [[HappyScoreViewController alloc] initWithNibName:@"HappyScoreViewController"
                                                             bundle:nil];
    }
    
    scoreVC.profile = profile;
    
    // viewDidLoad will be called
    [self presentViewController:scoreVC animated:YES completion:nil];
    
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
    [self presentViewController:challengeVC animated:YES completion:nil];
    
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
    [self presentViewController:remVC animated:YES completion:nil];
    
    self.remVC = nil;
}

- (IBAction)Help:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    if (nil == helpVC) {
        helpVC = [storyboard instantiateViewControllerWithIdentifier:@"805"];
    }
    
    helpVC.profile = profile;
    helpVC.fromScreen = @"Home";
    // viewDidLoad will be called
    [self presentViewController:(UIViewController *)helpVC animated:YES completion:nil];
    
    self.helpVC = nil;
}

@end

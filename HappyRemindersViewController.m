//
//  HappyRemindersViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappyRemindersViewController.h"

@interface HappyRemindersViewController ()

@end

@implementation HappyRemindersViewController

@synthesize remindersOnSwitch;
@synthesize profile;
@synthesize homeVC;
@synthesize bioVC;
@synthesize scoreVC;
@synthesize challengeVC;
@synthesize helpVC;
@synthesize emailFeedbackButton;
@synthesize emailFriendButton;

- (IBAction)Profile:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
	
    if (nil == bioVC) {
        bioVC = [storyboard instantiateViewControllerWithIdentifier:@"505"];
	}
	
	// viewDidLoad will be called
	//[self presentModalViewController:(UIViewController *)bioVC animated:YES];
    [self presentViewController:bioVC animated:YES completion:nil];
	self.bioVC = nil;
}

- (IBAction)Home:(id)sender
{
	if (nil == homeVC) {
		homeVC = [[HappyHomeViewController alloc] initWithNibName:@"HappyHomeViewController"
                                                           bundle:nil];
	}
    
    homeVC.profile = profile; // don't forget!!!
	
	// viewDidLoad will be called
	//[self presentModalViewController:homeVC animated:YES];
    [self presentViewController:homeVC animated:YES completion:nil];
	self.homeVC = nil;
}

- (IBAction)Score:(id)sender
{
	if (nil == scoreVC) {
		scoreVC = [[HappyScoreViewController alloc] initWithNibName:@"HappyScoreViewController"
                                                             bundle:nil];
	}
    
    scoreVC.profile = profile; // don't forget!!!
	
	// viewDidLoad will be called
	//[self presentModalViewController:scoreVC animated:YES];
    [self presentViewController:scoreVC animated:YES completion:nil];
	self.scoreVC = nil;
}

- (IBAction)Challenge:(id)sender
{
	if (nil == challengeVC) {
		challengeVC = [[HappyChallengeViewController alloc] initWithNibName:@"HappyChallengeViewController"
                                                                     bundle:nil];
	}
	
    challengeVC.profile = profile; // don't forget to pass that

	// viewDidLoad will be called
	//[self presentModalViewController:challengeVC animated:YES];
    [self presentViewController:challengeVC animated:YES completion:nil];
	self.challengeVC = nil;
}

- (IBAction)Help:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
	
    if (nil == helpVC) {
        helpVC = [storyboard instantiateViewControllerWithIdentifier:@"805"];
	}
	
	// viewDidLoad will be called
    helpVC.profile = self.profile;
    helpVC.fromScreen = @"Reminders";
	//[self presentModalViewController:(UIViewController *)helpVC animated:YES];
    [self presentViewController:helpVC animated:YES completion:nil];
	self.helpVC = nil;
}

- (IBAction)EmailFeeback:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        [controller setSubject:@"Thoughts on iBeHappy"];
        [controller setMessageBody:@"Hello there." isHTML:NO];
                //[controller setToRecipients:@"aska.szymczyk@gmail.com"];
        if (controller)
        {
            [self presentViewController:controller animated:YES completion:nil];
        }
        //[controller release];MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        [controller setSubject:@"iBeHappy"];
        [controller setMessageBody:@"Hello there." isHTML:NO];
              //  [controller setToRecipients:@"aska.szymczyk@gmail.com"];
        if (controller)
        {
            [self presentViewController:controller animated:YES completion:nil];
        }
        // Show the composer
    } else {
        // Handle the error
    }
}

- (IBAction)EmailFriend:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        [controller setSubject:@"Try iBeHappy"];
        [controller setMessageBody:@"Hello there." isHTML:NO];

        if (controller)
        {
            [self presentViewController:controller animated:YES completion:nil];
        }
        //[controller release];MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        [controller setSubject:@"iBeHappy"];
        [controller setMessageBody:@"Hello there." isHTML:NO];
        
        if (controller)
        {
            [self presentViewController:controller animated:YES completion:nil];
        }
        //[controller release];
        // Show the composer
    } else {
        // Handle the error
    }
}

- (IBAction)RemindersSwitch:(id)sender {
    
    if([sender isOn])
    {
        profile.remindersOn = TRUE;
    }
    else
    {
        profile.remindersOn = false;
    }
}
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
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
    // Do any additional setup after loading the view from its nib.
    //profile = [Utility unarchiveProfile];
    
    //if (nil == profile.reminders) {
    //     profile.reminders = @"YES";
    // }
        //
    // if ([profile.reminders compare:@"YES"] == 0) {
    //     remindersOnSwitch.on = YES;
    // }
    // else {
    //     remindersOnSwitch.on = NO;
    // }
    
    
    
    if (profile.remindersOn)
    {
        [self.remindersOnSwitch setOn:TRUE animated:true];
        UILocalNotification *uilocalNotifcation = [[UILocalNotification alloc] init];
        NSDate *onDate = [[NSDate alloc] init];
        uilocalNotifcation.fireDate = onDate;
        uilocalNotifcation.alertBody = profile.todaysChallenge.description;
        uilocalNotifcation.hasAction = true;
    }
    else
    {
       [self.remindersOnSwitch setOn:FALSE animated:true];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    //	NSLog(@"%d",[statsLabels retainCount]);
    ////	self.statsLabels = nil;
    //if (remindersOnSwitch.on) {
    //    profile.reminders = @"YES";
    //}
    // else {
        //profile.reminders = @"NO";
    // }
    
    [Utility archiveProfile:profile];
	
    [super viewWillDisappear:animated];
}

- (void)viewDidUnload
{
    [self setRemindersOnSwitch:nil];
    //[self setEmailFeedback:nil];
    [self setEmailFeedbackButton:nil];
    [self setEmailFriendButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

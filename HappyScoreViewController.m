//
//  HappyScoreViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappyScoreViewController.h"

@interface HappyScoreViewController ()

@end

@implementation HappyScoreViewController

@synthesize profile;
@synthesize bioVC;
@synthesize homeVC;
@synthesize remVC;
@synthesize challengeVC;
@synthesize helpVC;
@synthesize scoreDetailsLabel;
@synthesize completedLabel;
@synthesize daysDetailsLabel;
@synthesize statsTextview;

- (IBAction)Profile:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
	
    if (nil == bioVC) {
        bioVC = [storyboard instantiateViewControllerWithIdentifier:@"505"];
	}	
	// viewDidLoad will be called
	[self presentModalViewController:(UIViewController *)bioVC animated:YES];
	self.bioVC = nil;
}

- (IBAction)Home:(id)sender
{
	if (nil == homeVC) {
		homeVC = [[HappyHomeViewController alloc] initWithNibName:@"HappyHomeViewController"
                                                           bundle:nil];
	}
    homeVC.profile = profile;
	// viewDidLoad will be called
	[self presentModalViewController:homeVC animated:YES];
	self.homeVC = nil;
}

- (IBAction)Challenge:(id)sender
{
	if (nil == challengeVC) {
		challengeVC = [[HappyChallengeViewController alloc] initWithNibName:@"HappyChallengeViewController"
                                                                     bundle:nil];
	}
    challengeVC.profile = profile;
	// viewDidLoad will be called
	[self presentModalViewController:challengeVC animated:YES];
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
	[self presentModalViewController:remVC animated:YES];
	
	self.remVC = nil;
}
- (IBAction)Help:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    if (nil == helpVC) {
        helpVC = [storyboard instantiateViewControllerWithIdentifier:@"805"];
	}
	// viewDidLoad will be called
	[self presentModalViewController:(UIViewController *)helpVC animated:YES];
	self.helpVC = nil;
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
    NSString *statsText;
    NSString *profileText;
    if (profile != nil)
    {
        if(profile.numOfCompletedChallenges == 0)
        {
            //self.statsTextview.text
            statsText = [NSString stringWithFormat:@"%@, you haven't completed any challenges! \n", profile.name];
        }
        else
        {
            statsText = [NSString stringWithFormat:@"%@, you have completed %d out of %d challenges.You have a score of %d out of a maximum possible score of %d \n", profile.name,profile.numOfCompletedChallenges, profile.numOfViewedChallenges, profile.score, profile.maximumPossibleScore];
        }

        if (profile != nil)
        {
            profileText = [profile writeoutProfile];
        }
    }
    else
    {
        statsText = @"It looks like you don't have any challenges to complete because you haven't created a profile.";
        profileText = @"Click START on the home screen to get started!";
    }
    
    self.statsTextview.text = [NSString stringWithFormat:@"%@ %@",  statsText, profileText];
}

- (void)viewDidUnload
{
    [self setCompletedLabel:nil];
    [self setScoreDetailsLabel:nil];
    [self setDaysDetailsLabel:nil];
    [self setStatsTextview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

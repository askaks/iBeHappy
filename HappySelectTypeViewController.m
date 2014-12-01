//
//  HappySelectTypeViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappySelectTypeViewController.h"

@interface HappySelectTypeViewController ()

@end

@implementation HappySelectTypeViewController

@synthesize profile;

//@synthesize incomeVC;
//@synthesize prefsView;
@synthesize saveView;
@synthesize homeVC;
@synthesize remVC;
@synthesize scoreVC;
@synthesize challengeVC;

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

#pragma mark -
#pragma mark -prepare for segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    if ([segue.identifier isEqualToString:@"ToSave"]) {
        saveView = [segue destinationViewController];
        saveView.profile = self.profile;
        saveView.happyOptions = self.happyOptions;
    }
    else {
        bloodView.profile = self.profile;
        bloodView.happyOptions = self.happyOptions;
        [self.navigationController popViewControllerAnimated:YES];
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
        _happinessSlider.value = (float)profile.happiness/10.0f;
}

- (void)viewDidUnload
{
//    ProfileTypeSlider = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)happinessSet:(id)sender {
          profile.happiness = (NSInteger)(roundf(_happinessSlider.value * 10));
}
@end

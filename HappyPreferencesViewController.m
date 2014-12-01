//
//  HappyPreferencesViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappyPreferencesViewController.h"

@interface HappyPreferencesViewController ()

@end

@implementation HappyPreferencesViewController

@synthesize profile;
@synthesize bloodView;
//@synthesize selectVC;

@synthesize OpennessSlider;
@synthesize LanguageSlider;

@synthesize homeVC;
@synthesize remVC;
@synthesize scoreVC;
@synthesize challengeVC;
@synthesize incomeVC;


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
    if ([segue.identifier isEqualToString:@"ToBlood"]) 
    {
        bloodView = [segue destinationViewController];
        bloodView.profile = self.profile;
        bloodView.happyOptions = self.happyOptions;
    }
    else
    {
        incomeVC.profile = self.profile;
        incomeVC.happyOptions = self.happyOptions;
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)selectType:(id)sender
{
    if (sender == OpennessSlider) {
        profile.personality = (NSInteger)(roundf(OpennessSlider.value * 10));
    }
    else if (sender == LanguageSlider) {
        profile.language = (NSInteger)(roundf(LanguageSlider.value * 10));
    }
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
    OpennessSlider.value = (float)profile.personality/10.0f;
    LanguageSlider.value = (float)profile.language/10.0f;
    
}

- (void)viewDidUnload
{
    [self setOpennessSlider:nil];
    [self setLanguageSlider:nil];
    [self setDoneButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void) viewWillDisappear:(BOOL)animated {
	
//    profile.personality = OpennessSlider.value;
//    profile.language = LanguageSlider.value;
    
//    [Utility archiveProfile:profile]
	
	[super viewWillDisappear:animated];	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

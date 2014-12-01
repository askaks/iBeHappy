//
//  HappySaveViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappySaveViewController.h"
//#import <Parse/Parse.h>

@interface HappySaveViewController ()

@end

@implementation HappySaveViewController

@synthesize profile;

@synthesize bloodVC;
@synthesize bioVC;
@synthesize homeVC;
@synthesize remVC;
@synthesize challengeVC;
@synthesize scoreVC;
@synthesize savingIndicator;

- (IBAction)Profile:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
	
    if (nil == bioVC) {
        bioVC = [storyboard instantiateViewControllerWithIdentifier:@"505"];
	}
	
	// viewDidLoad will be called
	[self presentViewController:(UIViewController *)bioVC animated:YES completion:nil];
	
	self.bioVC = nil;
}

- (IBAction)Home:(id)sender
{
	if (nil == homeVC) {
		homeVC = [[HappyHomeViewController alloc] initWithNibName:@"HappyHomeViewController"
                                                           bundle:nil];
	}
	
	// viewDidLoad will be called
	[self presentViewController:homeVC animated:YES completion:nil];
	
	self.homeVC = nil;
}

- (IBAction)Score:(id)sender
{
	if (nil == scoreVC) {
		scoreVC = [[HappyScoreViewController alloc] initWithNibName:@"HappyScoreViewController"
                                                             bundle:nil];
	}
	
	// viewDidLoad will be called
	[self presentViewController:scoreVC animated:YES completion:nil];
	
	self.scoreVC = nil;
}

- (IBAction)Challenge
{
    savingIndicator.hidden = false;
    [savingIndicator startAnimating];
	if (nil == challengeVC) {
		challengeVC = [[HappyChallengeViewController alloc] initWithNibName:@"HappyChallengeViewController"
                                                                     bundle:nil];
	}
    
    challengeVC.profile = profile;
	
	// viewDidLoad will be called
	[self presentViewController:challengeVC animated:YES completion:nil];
    //challengeVC.profile = profile;
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

- (IBAction)SaveAll:(id)sender
{

    [Utility archiveProfile:profile];
    profile.profileCompleted = true;
    savingIndicator.hidden = false;
    [savingIndicator startAnimating];
    [self Challenge];
}



- (IBAction)GoBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
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
    savingIndicator.hidesWhenStopped = true;
    [savingIndicator stopAnimating];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setSavingIndicator:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

//
//  HappyHelpViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 11/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappyHelpViewController.h"

@interface HappyHelpViewController ()

@end

@implementation HappyHelpViewController

@synthesize Back;

@synthesize bioVC;
@synthesize homeVC;
@synthesize scoreVC;
@synthesize challengeVC;
@synthesize remVC;
@synthesize aboutVC;
@synthesize whyVC;

@synthesize aboutRegularButton;
@synthesize aboutStoryBoardButton;

@synthesize whyRegularButton;
@synthesize whyStoryboardButton;


- (IBAction)Profile:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
	
    if (nil == bioVC) {
        bioVC = [storyboard instantiateViewControllerWithIdentifier:@"505"];
	}
	
	// viewDidLoad will be called
	//[self presentModalViewController:(UIViewController *)bioVC animated:YES];
	
	self.bioVC = nil;
}

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

- (IBAction)About:(id)sender
{
	if (nil == aboutVC) {
		aboutVC = [[HappyAboutGameViewController alloc] initWithNibName:@"HappyAboutGameViewController"
                                                                     bundle:nil];
	}
	
	// viewDidLoad will be called
	//[self presentModalViewController:aboutVC animated:YES];
	
	self.aboutVC = nil;
}

- (IBAction)AboutRegular:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    if (nil == aboutVC) {
        aboutVC = [storyboard instantiateViewControllerWithIdentifier:@"807"];
    }
    // viewDidLoad will be called
	//[self presentModalViewController:(UIViewController *)aboutVC animated:YES];
	
	self.aboutVC = nil;
    
}

- (IBAction)WhyRegular:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        if (nil == whyVC) {
            whyVC = [storyboard instantiateViewControllerWithIdentifier:@"806"];
        }
    // viewDidLoad will be called
	//[self presentModalViewController:(UIViewController *)whyVC animated:YES];
	
	self.whyVC = nil;
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
    if ([segue.identifier isEqualToString:@"ToAbout"])
    {
        aboutVC = [segue destinationViewController];
        //aboutVC.profile = self.profile;
    }
//    else {
//        prefView = [segue destinationViewController];
//        prefView.profile = self.profile;
//    }
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
        if (self.navigationController == nil)
        {
            [self presentingViewController];
            
            self.aboutRegularButton.hidden = false;
            self.aboutStoryBoardButton.hidden = true;
            self.whyStoryboardButton.hidden = true;
            self.whyRegularButton.hidden = false;
        }
    else
    {
        self.aboutRegularButton.hidden = true;
        self.aboutStoryBoardButton.hidden = false;
        self.whyStoryboardButton.hidden = false;
        self.whyRegularButton.hidden = true;
    }
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setBack:nil];
    [self setAboutStoryBoardButton:nil];
    [self setAboutRegularButton:nil];
    [self setWhyRegularButton:nil];
    [self setWhyStoryboardButton:nil];
    [self setWhyRegularButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)back:(id)sender
{
    if (self.navigationController == nil)
    {
        if (nil == homeVC) {
            homeVC = [[HappyHomeViewController alloc] initWithNibName:@"HappyHomeViewController"
                                                               bundle:nil];
            [self presentViewController:homeVC animated:YES completion:nil];
            
            self.homeVC = nil;
        }
        else
        {
            //[self dismissModalViewControllerAnimated:YES];
        }
    }

    else
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end

//
//  HappyEducationViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappyEducationViewController.h"
#import <Parse/Parse.h>

#import "HappyOptions.h"

@interface HappyEducationViewController ()

@end

@implementation HappyEducationViewController

@synthesize profile;
@synthesize statusVC;
@synthesize incomeView;
@synthesize selectEducationPicker;
@synthesize types;
@synthesize ProfileBtn;

@synthesize homeVC;
@synthesize remVC;
@synthesize scoreVC;
@synthesize challengeVC;
@synthesize asFarEducationAsYouWant;


@synthesize pickerBackgroundView;
@synthesize selectEducationButton;
@synthesize doneWithPickerButton;

//@synthesize selectEducationLabel;
@synthesize educationSelectionText;

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
#pragma mark -Picker Popup Section

- (IBAction)selectEducationAction:(id)sender {
    selectEducationPicker.hidden = false;
    doneWithPickerButton.hidden = false;
    pickerBackgroundView.hidden = false;
}

- (IBAction)doneWithPicker:(id)sender {
    selectEducationPicker.hidden = true;
    doneWithPickerButton.hidden = true;
    pickerBackgroundView.hidden = true;
    
    bool found = [types containsObject:profile.education];
    
    if(!found)
    {
        profile.education = [types objectAtIndex: 0];
    }
    educationSelectionText.text = profile.education;
}

#pragma mark -
#pragma mark - Main Section

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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView 
{	
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView 
numberOfRowsInComponent:(NSInteger)component 
{
    return [types count];
}

- (UIView *)pickerView:(UIPickerView *)pickerView 
			viewForRow:(NSInteger)row 
		  forComponent:(NSInteger)component 
		   reusingView:(UIView *)view 
{
	UILabel *eduLabel;
	eduLabel=[[UILabel alloc] initWithFrame:CGRectMake(0,0,180,32)];
	eduLabel.backgroundColor=[UIColor clearColor];
	eduLabel.text=[types objectAtIndex:row];
	//eduLabel.textAlignment = UITextAlignmentCenter;
	eduLabel.font = [UIFont systemFontOfSize:22];
	return eduLabel;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView 
rowHeightForComponent:(NSInteger)component 
{
	return 35.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView 
	widthForComponent:(NSInteger)component 
{
    return 205.0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row 
	   inComponent:(NSInteger)component 
{
    //	int curr_index = row;
	
	int curr_index = (int)[pickerView selectedRowInComponent:0];
	
	profile.education = [types objectAtIndex: curr_index];
    educationSelectionText.text = profile.education;
    //selectEducationLabel.text = profile.education;
}

#pragma mark -
#pragma mark -prepare for segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    if ([profile.education isEqualToString:@""])
    {
        profile.education = [types objectAtIndex: 0];
    }
    if (self.asFarEducationAsYouWant.selectedSegmentIndex == 0)
    {
        profile.keepStudying = @"no";
    }
    else if(self.asFarEducationAsYouWant.selectedSegmentIndex == 1)
    {
        profile.keepStudying = @"yes";
    }
    if ([segue.identifier isEqualToString:@"ToIncome"])
    {
        incomeView = [segue destinationViewController];
        incomeView.profile = self.profile;
        incomeView.happyOptions = self.happyOptions;
    }
    else {
        statusVC = [segue destinationViewController];
        statusVC.profile = self.profile;
        statusVC.happyOptions = self.happyOptions;
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

    types = self.happyOptions.educationOptions;
    selectEducationPicker.delegate = self;
    
    int index = 0;
    
//    profile.education = [profile.relation stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (![profile.education isEqualToString:@""])
    {
        educationSelectionText.text = profile.education;
        index = [types indexOfObject:profile.education];
        if(index < 0 || index >= types.count)
            index = 0;
    }
    
    [selectEducationPicker selectRow:index inComponent:0 animated:YES];
}

- (void)viewDidUnload
{
    [self setSelectEducationPicker:nil];
    [self setProfileBtn:nil];
    [self setAsFarEducationAsYouWant:nil];
    [self setDoneButton:nil];
    //[self setSelectEducationLabel:nil];
    [self setEducationSelectionText:nil];
    [self setEducationSelectionText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end

//
//  HappyIncomeViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappyIncomeViewController.h"

@interface HappyIncomeViewController ()

@end

@implementation HappyIncomeViewController

@synthesize profile;
@synthesize eduVC;
//@synthesize selectView;
@synthesize preferencesView;

@synthesize sources;
@synthesize homeVC;
@synthesize remVC;
@synthesize scoreVC;
@synthesize challengeVC;
@synthesize jobAttitudeChoice;

@synthesize selectIncomeButton;
@synthesize doneWithPickerButton;
@synthesize sourcePicker;
@synthesize pickerBackgroundView;

@synthesize selectIncomeLabel;
@synthesize incomeSelectionText;

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

- (IBAction)selectIncomeAction:(id)sender {
    sourcePicker.hidden = false;
    doneWithPickerButton.hidden = false;
    pickerBackgroundView.hidden = false;
    incomeSelectionText.hidden = true;
}

- (IBAction)doneWithPicker:(id)sender {
    sourcePicker.hidden = true;
    doneWithPickerButton.hidden = true;
    pickerBackgroundView.hidden = true;
    incomeSelectionText.hidden = false;
    bool found = [sources containsObject:profile.income];
    
    if(!found)
    {
        profile.income = [sources objectAtIndex: 0];
    }
    incomeSelectionText.text = profile.income;
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
    return [sources count];
}

- (UIView *)pickerView:(UIPickerView *)pickerView 
			viewForRow:(NSInteger)row 
		  forComponent:(NSInteger)component 
		   reusingView:(UIView *)view 
{
	UILabel *incomeLabel;
	incomeLabel=[[UILabel alloc] initWithFrame:CGRectMake(0,0,180,32)];
	incomeLabel.backgroundColor=[UIColor clearColor];
	incomeLabel.text=[sources objectAtIndex:row];
	//incomeLabel.textAlignment = UITextAlignmentCenter;
	incomeLabel.font = [UIFont systemFontOfSize:22];
	return incomeLabel;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView 
rowHeightForComponent:(NSInteger)component 
{
	return 35.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView 
	widthForComponent:(NSInteger)component 
{
    return 190.0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row 
	   inComponent:(NSInteger)component 
{
	
	int curr_index = [pickerView selectedRowInComponent:0];
	
	profile.income = [sources objectAtIndex: curr_index];
    incomeSelectionText.text = profile.income;
}

#pragma mark -
#pragma mark -prepare for segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    if([profile.income isEqualToString:@""])
    {
        profile.income = [sources objectAtIndex:0
                          ];
    }
    if (jobAttitudeChoice.selectedSegmentIndex == 0)
    {
        profile.jobAttitude = @"yes";
    }
    else if(jobAttitudeChoice.selectedSegmentIndex == 1)
    {
        profile.jobAttitude = @"no";
    }
    else if(jobAttitudeChoice.selectedSegmentIndex == 2)
    {
        profile.jobAttitude = @"meh";
    }
    if ([segue.identifier isEqualToString:@"ToPreferences"])
    {
        preferencesView = [segue destinationViewController];
        preferencesView.profile = self.profile;
        preferencesView.happyOptions = self.happyOptions;
    }
    else
    {
        eduVC.profile = self.profile;
        eduVC.happyOptions = self.happyOptions;
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
    enum SourceOfIncome {
        trustFund = 0,
        loans,
        welfare,
        none,
        blueCollar,
        whiteCollar,
        parents,
        significantOther
    };
    [super viewDidLoad];
    
    sources = self.happyOptions.incomeOptions;
    sourcePicker.delegate = self;
    
    int index = 0;
    
    if (![profile.income isEqualToString:@""])
    {
        incomeSelectionText.text = profile.income;
        index = [sources indexOfObject:profile.income];
        if(index < 0 || index >= sources.count)
            index = 0;
    }
    
    [sourcePicker selectRow:index inComponent:0 animated:YES];
}

- (void)viewDidUnload
{
    [self setSourcePicker:nil];
    [self setJobAttitudeChoice:nil];
    [self setDoneButton:nil];
    [self setSelectIncomeButton:nil];
    //[self setSelectIncomeLabel:nil];
    [self setIncomeSelectionText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

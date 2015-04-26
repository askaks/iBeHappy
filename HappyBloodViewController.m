//
//  HappyBloodViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappyBloodViewController.h"

@interface HappyBloodViewController ()

@end

@implementation HappyBloodViewController

@synthesize profile;
@synthesize saveView;
@synthesize prefView;
@synthesize bloodTypePicker;
@synthesize types;
@synthesize homeVC;
@synthesize remVC;
@synthesize scoreVC;
@synthesize challengeVC;

@synthesize petStatuses;
@synthesize petPicker;

@synthesize changeDateVC;
@synthesize selectChildrenButton;
@synthesize selectPetsButton;
@synthesize doneButton;
@synthesize pickerBackgroundView;
@synthesize doneWithPickerButton;

@synthesize selectChildrenLabel;
@synthesize selectPetsLabel;

@synthesize childrenSelectionText;
@synthesize petSelectinText;

@synthesize childSelection;
@synthesize childSelectionText;

@synthesize petSelection;
@synthesize petSelectionText;

#pragma mark -Old Code: Tab Bar Section
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
#pragma mark - Enabling Done Button in Header

- (IBAction)doneAction:(id)sender {
    

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Profile Complete?"
                                                    message:@"Save profile and proceed to your first challenge?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles: @"Continue",nil];
    [alert show];
    
}
#pragma mark -
#pragma mark -Picker Popup Section

- (IBAction)selectChildrenAction:(id)sender {
     pickerBackgroundView.hidden = false;
    bloodTypePicker.hidden = false;
    doneWithPickerButton.hidden = false;
    childSelection = 0;
    profile.kids = [types objectAtIndex: childSelection];
    childrenSelectionText.text = profile.kids;
    petSelectinText.hidden = true;
    childrenSelectionText.hidden = true;
}

- (IBAction)selectPetsAction:(id)sender {
    petPicker.hidden = false;
    pickerBackgroundView.hidden = false;
    doneWithPickerButton.hidden = false;
    petSelection = 0;
    profile.pets = [petStatuses objectAtIndex: petSelection];
    petSelectinText.text = profile.pets;
    petSelectinText.hidden = true;
    childrenSelectionText.hidden = true;
}
- (IBAction)doneWithPetPicker:(id)sender {
    petPicker.hidden = true;
    pickerBackgroundView.hidden = true;
    doneWithPickerButton.hidden = false;
    
    bool found = [petStatuses containsObject:profile.pets];
    
    if(!found)
    {
        profile.pets = [petStatuses objectAtIndex: 0];
    }
    
    petSelectinText.text = profile.pets;
}

- (IBAction)doneWithPicker:(id)sender {
    petPicker.hidden = true;
    pickerBackgroundView.hidden = true;
    bloodTypePicker.hidden = true;
    doneWithPickerButton.hidden = true;
    childrenSelectionText.hidden = false;
    petSelectinText.hidden = false;
    
//    if (![childrenSelectionText.text isEqualToString:@"Children"] && ![petSelectinText.text isEqualToString:@"Pets"])
//    {
//            profile.profileCompleted = true;
//    }
}

#pragma mark -
#pragma mark - Main Section

-(void)alertView:(UIAlertView*)alert didDismissWithButtonIndex:(NSInteger)buttonIndex;
{
    NSLog(@">>> Entering %s <<<", __PRETTY_FUNCTION__);
    
    NSString *title = [alert buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"Continue"])
    {
        [Utility archiveProfile:profile];
        if (nil == challengeVC)
        {
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
    if(pickerView.tag == 543)
    {
        return [types count];
    }
    else
        return [petStatuses count];
}

- (UIView *)pickerView:(UIPickerView *)pickerView
			viewForRow:(NSInteger)row 
		  forComponent:(NSInteger)component 
		   reusingView:(UIView *)view 
{
	UILabel *bloodLabel;
	bloodLabel=[[UILabel alloc] initWithFrame:CGRectMake(0,0,90,32)];
	bloodLabel.backgroundColor=[UIColor clearColor];
    if(pickerView.tag == 543)
    {
        bloodLabel.text=[types objectAtIndex:row];
    }
    else
    {
        bloodLabel.text=[petStatuses objectAtIndex:row];
    }
	//bloodLabel.textAlignment = UITextAlignmentCenter;
	bloodLabel.font = [UIFont systemFontOfSize:22];
	return bloodLabel;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView 
rowHeightForComponent:(NSInteger)component 
{
	return 35.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView 
	widthForComponent:(NSInteger)component 
{
	if (component==0) {
		return 205.0;
	} else {
		return 0.0;
	}
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row 
	   inComponent:(NSInteger)component 
{
    if(pickerView.tag == 543)
    {
        childSelection = [pickerView selectedRowInComponent:0];
        profile.kids = [types objectAtIndex: childSelection];
        childrenSelectionText.text = profile.kids;
    }
    
    else
    {
        petSelection = [pickerView selectedRowInComponent:0];
        profile.pets = [petStatuses objectAtIndex: petSelection];
        petSelectinText.text = profile.pets;
    }
}

#pragma mark -
#pragma mark -prepare for segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    if ([segue.identifier isEqualToString:@"ToHappiness"]) 
    {
//        saveView = [segue destinationViewController];
//        saveView.profile = self.profile;
//        saveView.happyOptions = self.happyOptions;
        selectTypeVC = [segue destinationViewController];
        selectTypeVC.profile = self.profile;
        selectTypeVC.happyOptions = self.happyOptions;
    }
    else
    {
        prefView.profile = self.profile;
        prefView.happyOptions = self.happyOptions;
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
    types = self.happyOptions.childOptions;
    bloodTypePicker.delegate = self;
    
    int index = 0;
    
    if (![profile.kids isEqualToString:@""])
    {
        childrenSelectionText.text = profile.kids;
        int i;
        i = (int)[types indexOfObject:profile.kids];
        if (i>-1 && i < types.count) {
            index = i;
        }
    }
    
    [bloodTypePicker selectRow:index inComponent:0 animated:YES];
    
    petStatuses = self.happyOptions.petOptions;
    
    petPicker.delegate = self;
    
    index = 0;
    
    if (![profile.pets isEqualToString:@""])
    {
        petSelectinText.text = profile.pets;
        int i;
        i = (int)[petStatuses indexOfObject:profile.pets];
        if (i>-1 && i < petStatuses.count) {
            index = i;
        }
    }
    
    [petPicker selectRow:index inComponent:0 animated:YES ];
    
    self.navigationController.navigationItem.rightBarButtonItem = nil;
}

- (void)viewDidUnload
{
    [self setBloodTypePicker:nil];
    [self setTest:nil];
    [self setPetPicker:nil];
    [self setDoneButton:nil];
    [self setSelectChildrenButton:nil];
    [self setSelectPetsButton:nil];
    [self setPickerBackgroundView:nil];
    [self setDoneWithPickerButton:nil];
    [self setSelectChildrenButton:nil];
    [self setSelectChildrenButton:nil];
    [self setChildrenSelectionText:nil];
    [self setPetSelectinText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

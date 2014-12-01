//
//  HappyStatusViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappyStatusViewController.h"

@interface HappyStatusViewController ()

@end

@implementation HappyStatusViewController

@synthesize profile;
@synthesize eduView;
@synthesize bioView;
@synthesize statusPicker;
@synthesize list;
@synthesize isHappySegm;
@synthesize ProfileBtn;
@synthesize homeVC;
@synthesize remVC;
@synthesize scoreVC;
@synthesize challengeVC;
@synthesize viewController; // read WARNINGS


@synthesize doneWithPickerButton;
@synthesize selectRelationshipButton;
@synthesize pickerBackgroundView;

@synthesize selectRelationshipLabel;
@synthesize relationshipStatusText;

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

#pragma mark -
#pragma mark -Picker Popup Section

- (IBAction)selectRelationshipAction:(id)sender {
    statusPicker.hidden = false;
    doneWithPickerButton.hidden = false;
    pickerBackgroundView.hidden = false;
    relationshipStatusText.hidden = true;
}

- (IBAction)doneWithPicker:(id)sender {
    statusPicker.hidden = true;
    doneWithPickerButton.hidden = true;
    pickerBackgroundView.hidden = true;
    relationshipStatusText.hidden = false;
    bool found = [list containsObject:profile.relation];
    
    if(!found)
    {
        profile.relation = [list objectAtIndex: 0];
    }
    
    relationshipStatusText.text = profile.relation;
}

#pragma mark -
#pragma mark - Main Section

- (IBAction)CommentOnStatus:(id)sender {
        if (self.isHappySegm.selectedSegmentIndex == 1)
        {
            
            //profile.relationshipContentment = @"no";
            //enum ANS answer = [HappyProfile ANS::yes];
        
            //profile.relationshipContentment = self.isHappySegm.selectedSegmentIndex;
            //UIAlertView *ualertView = [UIAlertView alloc];
            //ualertView.title = @"I bet you are";
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thought so."
            message:@""
                   delegate:nil
            cancelButtonTitle:@"OK"
            otherButtonTitles: nil];
            [alert show];
            // [ualertView release];
        }
        else if(self.isHappySegm.selectedSegmentIndex == 0)
        {
            //profile.relationshipContentment = @"yes";
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                            message:@"Sure you are."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];
        }
        else if(self.isHappySegm.selectedSegmentIndex == 2)
        {
            //profile.relationshipContentment = @"yes";
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                            message:@"That's more like it."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    
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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView 
{	
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView 
numberOfRowsInComponent:(NSInteger)component 
{
    return [list count];
}

- (UIView *)pickerView:(UIPickerView *)pickerView 
			viewForRow:(NSInteger)row 
		  forComponent:(NSInteger)component 
		   reusingView:(UIView *)view 
{
	UILabel *statusLabel;
	statusLabel=[[UILabel alloc] initWithFrame:CGRectMake(0,0,120,32)];
	statusLabel.backgroundColor=[UIColor clearColor];
	statusLabel.text=[list objectAtIndex:row];
	//statusLabel.textAlignment = UITextAlignmentCenter;
	statusLabel.font = [UIFont systemFontOfSize:22];
	return statusLabel;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView 
rowHeightForComponent:(NSInteger)component 
{
	return 35.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView 
	widthForComponent:(NSInteger)component 
{
    return 145.0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row 
	   inComponent:(NSInteger)component 
{
    //	int curr_index = row;
	
	int curr_index = [pickerView selectedRowInComponent:0];
	
	profile.relation = [list objectAtIndex: curr_index];
    relationshipStatusText.text = profile.relation;
    //selectRelationshipLabel.text = profile.relation;
}

#pragma mark -
#pragma mark -prepare for segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    if( [profile.relation isEqualToString:@""])
    {
        profile.relation =[list objectAtIndex: 0];
    }
    if (self.isHappySegm.selectedSegmentIndex == 1)
    {
    
        profile.relationshipContentment = @"no";
    }
    else if (self.isHappySegm.selectedSegmentIndex == 0)
    {
        profile.relationshipContentment = @"yes";
    }
    else if(self.isHappySegm.selectedSegmentIndex == 2)
    {
        profile.relationshipContentment = @"meh";
    }
    if ([segue.identifier isEqualToString:@"ToEducation"])
    {
        eduView = [segue destinationViewController];
        eduView.profile = self.profile;
        eduView.happyOptions = self.happyOptions;
    }
    else
    {
        bioView.profile = self.profile;
        bioView.happyOptions = self.happyOptions;
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
//    list = [[NSArray alloc] initWithObjects:@"Single",@"Dating", @"Committed", @"Married",@"Divorced", @"Widowed", @"Not Looking",nil];
    
    
    list = self.happyOptions.loveOptions;
    statusPicker.delegate = self;
    
    int index = 0;
        profile.relation = [profile.relation stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (![profile.relation isEqualToString:@""]) {
        index = [list indexOfObject:profile.relation];
    }

    [statusPicker selectRow:index inComponent:0 animated:YES];
    if(![profile.relation isEqualToString:@""])
    {
        relationshipStatusText.text = profile.relation;
    }
}

- (void)viewDidUnload
{
    [self setStatusPicker:nil];
    [self setIsHappySegm:nil];
    [self setProfileBtn:nil];
    [self setDoneButton:nil];
    [self setRelationshipPicker:nil];
    //[self setSelectRelationshipLabel:nil];
    [self setRelationshipStatusText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

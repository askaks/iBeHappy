//
//  HappyEducationViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HappyProfile.h"
#import "HappyStartViewController.h"
#import "HappyStatusViewController.h"
#import "HappyIncomeViewController.h"
#import "HappyHomeViewController.h"
#import "HappyScoreViewController.h"
#import "HappyChallengeViewController.h"
#import "HappyRemindersViewController.h"

#import "HappyOptions.h"

@class HappyStatusViewController;
@class HappyHomeViewController;
@class HappyScoreViewController;
@class HappyChallengeViewController;
@class HappyIncomeViewController;
@class HappyRemindersViewController;

@interface HappyEducationViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    
    HappyProfile *profile;
    HappyStatusViewController *statusVC;
    HappyIncomeViewController *incomeView;
    NSArray *types;
    
    HappyHomeViewController *homeVC;
    HappyScoreViewController *scoreVC;
    HappyChallengeViewController *challengeVC;
    HappyRemindersViewController *remVC;
}

@property (nonatomic, retain) HappyProfile *profile;

@property (nonatomic, retain) HappyStatusViewController *statusVC;
@property (nonatomic, retain) HappyIncomeViewController *incomeView;

@property (nonatomic, retain) NSArray *types;
@property (strong, nonatomic) IBOutlet UIButton *ProfileBtn;

@property (nonatomic, retain) HappyHomeViewController *homeVC;
@property (nonatomic, retain) HappyScoreViewController *scoreVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (nonatomic, retain) HappyRemindersViewController *remVC;
@property (weak, nonatomic) IBOutlet UISegmentedControl *asFarEducationAsYouWant;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@property (nonatomic, retain) HappyOptions *happyOptions;

#pragma mark -
#pragma mark -Picker Popup Section
@property (weak, nonatomic) IBOutlet UIButton *selectEducationButton;
@property (weak, nonatomic) IBOutlet UIImageView *pickerBackgroundView;
@property (weak, nonatomic) IBOutlet UIButton *doneWithPickerButton;
@property (strong, nonatomic) IBOutlet UIPickerView *selectEducationPicker;
@property (weak, nonatomic) IBOutlet UITextField *educationSelectionText;

#pragma mark -
#pragma mark - Main Action Section
- (IBAction)Home:(id)sender;
- (IBAction)Score:(id)sender;
- (IBAction)Challenge:(id)sender;
- (IBAction)Reminders:(id)sender;
- (IBAction)doneAction:(id)sender;


#pragma -mark
#pragma Picker Pop Up Section
- (IBAction)selectEducationAction:(id)sender;
- (IBAction)doneWithPicker:(id)sender;


@end

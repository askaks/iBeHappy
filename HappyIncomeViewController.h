//
//  HappyIncomeViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HappyProfile.h"
#import "HappyEducationViewController.h"
#import "HappySelectTypeViewController.h"
//#import "HappyHomeViewController.h"
//#import "HappyRemindersViewController.h"
//#import "HappyPreferencesViewController.h"

#import "HappyOptions.h"

@class HappyEducationViewController;
@class HappySelectTypeViewController;
@class HappyHomeViewController;
@class HappyScoreViewController;
@class HappyChallengeViewController;
@class HappyIncomeViewController;
//@class HappyRemindersViewController;
@class HappyPreferencesViewController;

@interface HappyIncomeViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    
//    HappyProfile *profile;
//    HappyEducationViewController *eduVC;
////    HappySelectTypeViewController *selectView;
//    HappyPreferencesViewController *preferencesView;
//    NSArray *sources;
//    
//    HappyScoreViewController *scoreVC;
//    HappyChallengeViewController *challengeVC;
}

@property (nonatomic, retain) HappyProfile *profile;

@property (nonatomic, retain) HappyEducationViewController *eduVC;
//@property (nonatomic, retain) HappySelectTypeViewController *selectView;
@property (nonatomic, retain) HappyPreferencesViewController *preferencesView;

@property (nonatomic, retain) NSArray *sources;

@property (nonatomic, retain) HappyHomeViewController *homeVC;
@property (nonatomic, retain) HappyScoreViewController *scoreVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (nonatomic, retain) HappyRemindersViewController *remVC;
@property (weak, nonatomic) IBOutlet UISegmentedControl *jobAttitudeChoice;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

#pragma mark -
#pragma mark -Picker Popup Section

@property (weak, nonatomic) IBOutlet UIButton *selectIncomeButton;
@property (weak, nonatomic) IBOutlet UIImageView *pickerBackgroundView;
@property (weak, nonatomic) IBOutlet UIButton *doneWithPickerButton;
@property (strong, nonatomic) IBOutlet UIPickerView *sourcePicker;

@property (weak, nonatomic) IBOutlet UILabel *selectIncomeLabel;
@property (weak, nonatomic) IBOutlet UITextField *incomeSelectionText;

@property (nonatomic, retain) HappyOptions *happyOptions;

#pragma mark -
#pragma mark - Main Action Section
//- (IBAction)Home:(id)sender;
//- (IBAction)Reminders:(id)sender;
- (IBAction)doneAction:(id)sender;


#pragma -mark
#pragma Picker Pop Up Section
- (IBAction)selectIncomeAction:(id)sender;
- (IBAction)doneWithPicker:(id)sender;

@end

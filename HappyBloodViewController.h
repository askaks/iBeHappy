//
//  HappyBloodViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HappyProfile.h"
#import "HappySaveViewController.h"
#import "HappyHomeViewController.h"
#import "HappyRemindersViewController.h"
#import "ChangeDateViewController.h"
#import "HappySelectTypeViewController.h"
#import "HappyPreferencesViewController.h"

#import "HappyOptions.h"

@class HappySaveViewController;
@class HappyPreferencesViewController;
@class HappySelectTypeViewController;
@class HappyHomeViewController;
@class HappyScoreViewController;
@class HappyChallengeViewController;
@class HappyIncomeViewController;
@class HappyRemindersViewController;

@interface HappyBloodViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>  {
    
    HappyProfile *profile;
    HappySaveViewController *saveView;
    HappyPreferencesViewController *prefView;
    HappyHomeViewController *homeVC;
    HappyScoreViewController *scoreVC;
    HappyChallengeViewController *challengeVC;
    HappyRemindersViewController *remVC;
    HappySelectTypeViewController *selectTypeVC;
    
    NSArray *types;
    NSArray *petStatuses;
}

@property (nonatomic, retain) HappyProfile *profile; 
@property (nonatomic, retain) HappySaveViewController *saveView;
@property (nonatomic, retain) HappyPreferencesViewController *prefView;
@property (nonatomic, retain) HappyHomeViewController *homeVC;
@property (nonatomic, retain) HappyScoreViewController *scoreVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (nonatomic, retain) HappyRemindersViewController *remVC;
@property (nonatomic, retain) ChangeDateViewController *changeDateVC;
@property (nonatomic, retain) HappySelectTypeViewController *selectTypeVC;
@property (weak, nonatomic) IBOutlet UILabel *selectChildrenLabel;
@property (weak, nonatomic) IBOutlet UILabel *selectPetsLabel;
@property (weak, nonatomic) IBOutlet UITextField *childrenSelectionText;
@property (weak, nonatomic) IBOutlet UITextField *petSelectinText;



@property (strong, nonatomic) IBOutlet UIPickerView *bloodTypePicker;
@property (strong, nonatomic) IBOutlet UILabel *test;
@property (weak, nonatomic) IBOutlet UIPickerView *petPicker;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (nonatomic, retain) NSArray *types;
@property (nonatomic, retain) NSArray *petStatuses;


@property (nonatomic, retain) NSString *childSelectionText;
@property NSInteger childSelection;
@property (nonatomic, retain) NSString *petSelectionText;
@property NSInteger petSelection;

@property (nonatomic, retain) HappyOptions *happyOptions;

#pragma -mark
#pragma Picker Pop Up Section
@property (weak, nonatomic) IBOutlet UIButton *selectChildrenButton;
@property (weak, nonatomic) IBOutlet UIButton *selectPetsButton;
@property (weak, nonatomic) IBOutlet UIImageView *pickerBackgroundView;
@property (weak, nonatomic) IBOutlet UIButton *doneWithPickerButton;


#pragma -mark
#pragma Main Section

- (IBAction)Home:(id)sender;
- (IBAction)Reminders:(id)sender;
- (IBAction)doneAction:(id)sender;

#pragma -mark
#pragma Picker Pop Up Section
- (IBAction)selectChildrenAction:(id)sender;
- (IBAction)selectPetsAction:(id)sender;
- (IBAction)doneWithPicker:(id)sender;



@end

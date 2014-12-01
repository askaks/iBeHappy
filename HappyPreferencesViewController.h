//
//  HappyPreferencesViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Utility.h"
#import "HappyProfile.h"
#import "HappySelectTypeViewController.h"
#import "HappyBloodViewController.h"
#import "HappyHomeViewController.h"
#import "HappyRemindersViewController.h"
#import "HappyIncomeViewController.h"

#import "HappyOptions.h"

@class HappySelectTypeViewController;
@class HappyBloodViewController;
@class HappyPreferencesViewController;
@class HappySaveViewController;
@class HappyHomeViewController;
@class HappyScoreViewController;
@class HappyChallengeViewController;
@class HappyIncomeViewController;
@class HappyRemindersViewController;

@interface HappyPreferencesViewController : UIViewController {
    
    HappyProfile *profile;
    HappyBloodViewController *bloodView;
    HappyIncomeViewController *incomeVC;
}

@property (nonatomic, retain) HappyProfile *profile; 

//@property (nonatomic, retain) HappySelectTypeViewController *selectVC;
@property (nonatomic, retain) HappyIncomeViewController *incomeVC;

@property (nonatomic, retain) HappyBloodViewController *bloodView;

@property (strong, nonatomic) IBOutlet UISlider *OpennessSlider;
@property (strong, nonatomic) IBOutlet UISlider *LanguageSlider;

@property (nonatomic, retain) HappyHomeViewController *homeVC;
@property (nonatomic, retain) HappyScoreViewController *scoreVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (nonatomic, retain) HappyRemindersViewController *remVC;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@property (nonatomic, retain) HappyOptions *happyOptions;

- (IBAction)Home:(id)sender;
- (IBAction)Reminders:(id)sender;

//- (void)setUserProfile:(HappyProfile *)user;
- (IBAction)selectType:(id)sender;
- (IBAction)doneAction:(id)sender;

@end

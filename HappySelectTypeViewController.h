//
//  HappySelectTypeViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Utility.h"
#import "HappyProfile.h"
#import "HappyIncomeViewController.h"
#import "HappyBloodViewController.h"
#import "HappySaveViewController.h"
#import "HappyHomeViewController.h"
#import "HappyRemindersViewController.h"

#import "HappyOptions.h"

@class HappyBloodViewController;
@class HappySaveViewController;
@class HappyHomeViewController;
@class HappyScoreViewController;
@class HappyChallengeViewController;
@class HappyIncomeViewController;
@class HappyRemindersViewController;

@interface HappySelectTypeViewController : UIViewController {
    
    HappyProfile *profile;
    HappyBloodViewController *bloodView;
    HappySaveViewController *saveView;

//    IBOutlet UIButton *ShortBtn;
//    IBOutlet UIButton *LongBtn;
}

@property (nonatomic, retain) HappyProfile *profile;

//@property (nonatomic, retain) HappyIncomeViewController *incomeVC;
@property (nonatomic, retain) HappyBloodViewController *bloodView;
@property (nonatomic, retain) HappySaveViewController *saveView;

@property (nonatomic, retain) HappyHomeViewController *homeVC;
@property (nonatomic, retain) HappyScoreViewController *scoreVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (nonatomic, retain) HappyRemindersViewController *remVC;
@property (weak, nonatomic) IBOutlet UISlider *happinessSlider;


- (IBAction)Home:(id)sender;
- (IBAction)Reminders:(id)sender;

@property (nonatomic, retain) HappyOptions *happyOptions;
- (IBAction)happinessSet:(id)sender;

@end

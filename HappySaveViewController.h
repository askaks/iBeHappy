//
//  HappySaveViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Utility.h"
#import "HappyProfile.h"

#import "HappyBloodViewController.h"
#import "HappyBioViewController.h"
#import "HappyHomeViewController.h"
#import "HappyRemindersViewController.h"

#import "HappyOptions.h"

@class HappyBloodViewController;
@class HappyBioViewController;
@class HappyPreferencesViewController;
@class HappySaveViewController;
@class HappyHomeViewController;
@class HappyScoreViewController;
@class HappyChallengeViewController;
@class HappyIncomeViewController;
@class HappyRemindersViewController;

@interface HappySaveViewController : UIViewController {

    HappyProfile *profile;
    
    HappyBloodViewController *bloodVC;
    HappyBioViewController *bioVC;
    HappyHomeViewController *homeVC;
    HappyScoreViewController *scoreVC;
    HappyChallengeViewController *challengeVC;
    HappyRemindersViewController *remVC;
}

@property (nonatomic, retain) HappyBioViewController *bioVC;
@property (nonatomic, retain) HappyProfile *profile;
@property (nonatomic, retain) HappyBloodViewController *bloodVC;
@property (nonatomic, retain) HappyHomeViewController *homeVC;
@property (nonatomic, retain) HappyRemindersViewController *remVC;
@property (nonatomic, retain) HappyScoreViewController *scoreVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *savingIndicator;

@property (nonatomic, retain) HappyOptions *happyOptions;

- (IBAction)Home:(id)sender;
- (IBAction)Reminders:(id)sender;
//- (IBAction)Challenge;

- (IBAction)SaveAll:(id)sender;
- (IBAction)GoBack:(id)sender;

@end

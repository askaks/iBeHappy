//
//  HappyScoreViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HappyBioViewController.h"
#import "HappyHomeViewController.h"
#import "HappyRemindersViewController.h"
#import "HappyScoreViewController.h"
#import "HappyChallengeViewController.h"
#import "HappyHelpViewController.h"
#import "HappyProfile.h"


@class HappyBioViewController;
@class HappyChallengeViewController;
@class HappyPreferencesViewController;
@class HappySaveViewController;
@class HappyHomeViewController;
@class HappyScoreViewController;
@class HappyChallengeViewController;
@class HappyIncomeViewController;
@class HappyRemindersViewController;
@class HappyHelpViewController;

@interface HappyScoreViewController : UIViewController {
    
    HappyBioViewController *bioVC;
    HappyHomeViewController *homeVC;
    HappyChallengeViewController *challengeVC;
    HappyRemindersViewController *remVC;
    HappyHelpViewController*helpVC;
    HappyProfile *profile;
}

@property (nonatomic, retain) HappyProfile *profile;
@property (nonatomic, retain) HappyBioViewController *bioVC;
@property (nonatomic, retain) HappyHomeViewController *homeVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (nonatomic, retain) HappyRemindersViewController *remVC;
@property (nonatomic, retain) HappyHelpViewController *helpVC;
@property (weak, nonatomic) IBOutlet UILabel *completedLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreDetailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysDetailsLabel;
@property (weak, nonatomic) IBOutlet UITextView *statsTextview;
@property (weak, nonatomic) IBOutlet UIImageView *profilePhoto;




- (IBAction)Profile:(id)sender;
- (IBAction)Home:(id)sender;
- (IBAction)Challenge:(id)sender;
- (IBAction)Reminders:(id)sender;
- (IBAction)Help:(id)sender;

@end

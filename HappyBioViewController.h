//
//  HappyBioViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Utility.h"
#import "HappyCustomSegue.h"
#import "HappyProfile.h"
#import "HappyStartViewController.h"
#import "HappyStatusViewController.h"
#import "HappyHomeViewController.h"
#import "HappyScoreViewController.h"
#import "HappyChallengeViewController.h"
#import "HappyRemindersViewController.h"
#import "ChangeDateViewController.h"

#import "HappyOptions.h"

@class HappyStartViewController;
@class HappyRemindersViewController;
@class HappyStatusViewController;
@class HappyScoreViewController;
@class HappyHomeViewController;

@interface HappyBioViewController : UIViewController
{
    HappyProfile *profile;
    HappyStatusViewController *statusVC;
}

@property (strong, nonatomic) IBOutlet UIButton *dateBtn;
@property (nonatomic, retain) NSDateFormatter *dateFormat;

@property (nonatomic, retain) HappyProfile *profile;

@property (nonatomic, retain) HappyStartViewController *startVC;
@property (nonatomic, retain) HappyStatusViewController *statusVC;
@property (nonatomic, retain) HappyHomeViewController *homeVC;
@property (nonatomic, retain) HappyScoreViewController *scoreVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (nonatomic, retain) HappyRemindersViewController *remVC;
@property (weak, nonatomic) IBOutlet UISegmentedControl *interestedInChoice;

@property (nonatomic, retain) ChangeDateViewController *changeDateVC;

@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sexChoice;
@property (weak, nonatomic) IBOutlet UITextField *happinessRatingText;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;

@property (nonatomic, retain) HappyOptions *happyOptions;
@property (weak, nonatomic) IBOutlet UIImageView *profilePhotoImage;
@property (weak, nonatomic) IBOutlet UIButton *profilePhotoButton;
@property (nonatomic, strong) NSMutableData *imageData;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@property (weak, nonatomic) IBOutlet UIButton *helpButton;

- (IBAction)Reminders:(id)sender;
- (IBAction)Home:(id)sender;
- (IBAction)changeDate;
- (IBAction)doneAction:(id)sender;
- (IBAction)logoutButtonTouchHandler:(id)sender;



@end

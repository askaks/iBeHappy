//
//  HappyHomeViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HappyProfile.h"

#import "HappyViewController.h"
#import "HappyBioViewController.h"
#import "HappyHelpViewController.h"
#import "HappyRemindersViewController.h"
#import "HappyScoreViewController.h"
#import "HappyChallengeViewController.h"
#import "HappySignupViewController.h"

@class HappyViewController;
@class HappyHelpViewController;
@class HappyBioViewController;
@class HappyRemindersViewController;
@class HappyScoreViewController;
@class HappyChallengeViewController;

@interface HappyHomeViewController : UIViewController

@property (nonatomic, retain) HappyViewController *viewController;
@property (nonatomic, retain) HappyHelpViewController *helpVC;
@property (nonatomic, retain) HappyProfile *profile;
//@property (strong, nonatomic) IBOutlet UITextField *nameText;
//@property (strong, nonatomic) IBOutlet UITextField *happyChallengeText;

@property (nonatomic, retain) HappyBioViewController *bioVC;
@property (nonatomic, retain) HappyScoreViewController *scoreVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (nonatomic, retain) HappyRemindersViewController *remVC;
@property (weak, nonatomic) IBOutlet UITextView *helloUserText;
@property (weak, nonatomic) IBOutlet UILabel *happinessRatingLabel;
@property (weak, nonatomic) IBOutlet UIButton *startOverButton;
@property bool startOver;
@property (weak, nonatomic) IBOutlet UIButton *updateProfileButton;
@property (weak, nonatomic) IBOutlet UIButton *nextLevelButton;
@property (weak, nonatomic) IBOutlet UIButton *restartButton;

- (IBAction)StartingOver:(id)sender;
- (IBAction)UpdateProfile:(id)sender;
- (IBAction)JumpToNextLevel:(id)sender;


- (IBAction)Profile:(id)sender;
- (IBAction)Score:(id)sender;
- (IBAction)Challenge:(id)sender;
- (IBAction)Reminders:(id)sender;
- (IBAction)Help:(id)sender;
- (IBAction)RestartChallengesAction:(id)sender;

@end

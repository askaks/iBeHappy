//
//  HappyRemindersViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Utility.h"
#import "HappyProfile.h"
//#import "HappyBioViewController.h"
#import "HappyHomeViewController.h"
#import "HappyScoreViewController.h"
#import "HappyChallengeViewController.h"
#import <MessageUI/MFMailComposeViewController.h>

@class HappyBioViewController;
@class HappyHomeViewController;
@class HappyScoreViewController;
@class HappyChallengeViewController;
@class HappyHelpViewController;

@interface HappyRemindersViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISwitch *remindersOnSwitch;

@property (nonatomic, retain) HappyProfile *profile; 

@property (nonatomic, retain) HappyBioViewController *bioVC;
@property (nonatomic, retain) HappyHomeViewController *homeVC;
@property (nonatomic, retain) HappyScoreViewController *scoreVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (nonatomic, retain) HappyHelpViewController *helpVC;
@property (weak, nonatomic) IBOutlet UIButton *emailFeedbackButton;
@property (weak, nonatomic) IBOutlet UIButton *emailFriendButton;

- (IBAction)Profile:(id)sender;
- (IBAction)Help:(id)sender;
- (IBAction)EmailFeeback:(id)sender;
- (IBAction)EmailFriend:(id)sender;
- (IBAction)RemindersSwitch:(id)sender;



@end

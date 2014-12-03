//
//  HappyHelpViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 11/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HappyBioViewController.h"
#import "HappyHomeViewController.h"
#import "HappyScoreViewController.h"
#import "HappyChallengeViewController.h"
#import "HappyRemindersViewController.h"
#import "HappyAboutGameViewController.h"
#import "HappyTeamViewController.h"

#import "HappyProfile.h"

@class HappyBioViewController;
@class HappyHomeViewController;
@class HappyScoreViewController;
@class HappyChallengeViewController;
@class HappyRemindersViewController;
@class HappyAboutGameViewController;

@interface HappyHelpViewController : UIViewController

@property (nonatomic, retain) HappyBioViewController *bioVC;
@property (nonatomic, retain) HappyHomeViewController *homeVC;
@property (nonatomic, retain) HappyScoreViewController *scoreVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (nonatomic, retain) HappyRemindersViewController *remVC;
@property (nonatomic, retain) HappyAboutGameViewController * aboutVC;
@property (nonatomic, retain) HappyTeamViewController * whyVC;

@property (weak, nonatomic) IBOutlet UIButton *Back;
@property (weak, nonatomic) IBOutlet UIButton *aboutStoryBoardButton;
@property (weak, nonatomic) IBOutlet UIButton *aboutRegularButton;
@property (weak, nonatomic) IBOutlet UIButton *whyStoryboardButton;
@property (weak, nonatomic) IBOutlet UIButton *whyRegularButton;

@property (nonatomic, retain) HappyProfile *profile;
@property (nonatomic, retain) NSString *fromScreen;

- (IBAction)back:(id)sender;
- (IBAction)About:(id)sender;
- (IBAction)AboutRegular:(id)sender;
- (IBAction)WhyRegular:(id)sender;

@end

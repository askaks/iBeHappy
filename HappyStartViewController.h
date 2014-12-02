//
//  HappyStartViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HappyProfile.h"

#import "HappyViewController.h"
#import "HappyBioViewController.h"
#import "HappyHomeViewController.h"
#import "HappyScoreViewController.h"
#import "HappyChallengeViewController.h"
#import "HappyRemindersViewController.h"
#import "HappyHelpViewController.h"

#import "HappySignupViewController.h"

#import "HappyOptions.h"

@class HappyViewController;

@interface HappyStartViewController : UIViewController {
    HappyViewController *viewVC;
    HappyBioViewController *bioVC;
    HappyHomeViewController *homeVC;
    HappyScoreViewController *scoreVC;
    HappyChallengeViewController *challengeVC;
    HappyRemindersViewController *remVC;
}

@property (nonatomic, retain) HappyProfile *profile;

@property (nonatomic, retain)HappyViewController *viewVC;
@property (nonatomic, retain) HappyBioViewController *bioVC;
@property (nonatomic, retain) HappyHomeViewController *homeVC;
@property (nonatomic, retain) HappyScoreViewController *scoreVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (nonatomic, retain) HappyRemindersViewController *remVC;


@property (nonatomic, strong) NSMutableData *imageData;
@property (nonatomic, strong) IBOutlet UIImageView *headerImageView;

@property (strong, nonatomic) IBOutlet UITabBarItem *ProfileTab;
@property (weak, nonatomic) IBOutlet UIImageView *popUpBackground;
@property (weak, nonatomic) IBOutlet UIButton *startExplanationButton;
//@property (weak, nonatomic) IBOutlet UITextView *initialText;
@property (weak, nonatomic) IBOutlet UIButton *helpButton;
@property (weak, nonatomic) IBOutlet UIButton *goButton;

@property (weak, nonatomic) IBOutlet UITextView *welcomeMessageText;

@property (nonatomic, retain) HappyOptions *happyOptions;


- (IBAction)Home:(id)sender;
- (IBAction)Score:(id)sender;
- (IBAction)Challenge:(id)sender;
- (IBAction)Reminders:(id)sender;
- (IBAction)Explain:(id)sender;
- (IBAction)AToBAction:(id)sender;
- (IBAction)BToCAction:(id)sender;
- (IBAction)CToDAction:(id)sender;
- (IBAction)DtoEAction:(id)sender;
- (IBAction)EToFAction:(id)sender;
- (IBAction)EtoEPart2Action:(id)sender;
- (IBAction)logoutButtonTouchHandler:(id)sender;


@end

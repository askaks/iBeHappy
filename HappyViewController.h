//
//  HappyViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HappyProfile.h"

#import "HappyStartViewController.h"
#import "HappyRemindersViewController.h"
#import "HappyHomeViewController.h"
#import "HappyScoreViewController.h"
#import "HappyChallengeViewController.h"

#import "HappyOptions.h"

@class HappyStartViewController;

@interface HappyViewController : UIViewController
    
@property (nonatomic, retain) HappyProfile *profile;

@property (nonatomic, retain)HappyStartViewController *startVC;
@property (nonatomic, retain) HappyHomeViewController *homeVC;
@property (nonatomic, retain) HappyScoreViewController *scoreVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (nonatomic, retain) HappyRemindersViewController *remVC;

@property (nonatomic, retain) HappyOptions *happyOptions;

- (IBAction)Home:(id)sender;
- (IBAction)Score:(id)sender;
- (IBAction)Challenge:(id)sender;
- (IBAction)Reminders:(id)sender;

@end

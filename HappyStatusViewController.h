//
//  HappyStatusViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HappyProfile.h"

#import "HappyViewController.h"
#import "HappyBioViewController.h"
#import "HappyEducationViewController.h"
#import "HappyHomeViewController.h"
#import "HappyScoreViewController.h"
#import "HappyChallengeViewController.h"
#import "HappyRemindersViewController.h"

#import "HappyOptions.h"

@class HappyViewController;
@class HappyBioViewController;
@class HappyScoreViewController;
@class HappyEducationViewController;

@interface HappyStatusViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIAlertViewDelegate> {
    
    HappyProfile *profile;
    HappyViewController *viewController;
    HappyEducationViewController *eduView;
    HappyBioViewController *bioView;
    NSArray *list;

    HappyHomeViewController *homeVC;
    HappyScoreViewController *scoreVC;
    HappyChallengeViewController *challengeVC;
    HappyRemindersViewController *remVC;
}

@property (nonatomic, retain) HappyProfile *profile;
@property (nonatomic, retain) HappyViewController *viewController;
@property (nonatomic, retain) HappyEducationViewController *eduView;
@property (nonatomic, retain) HappyBioViewController *bioView;
@property (strong, nonatomic) IBOutlet UIPickerView *statusPicker;
@property (nonatomic, retain) NSArray *list;
@property (strong, nonatomic) IBOutlet UISegmentedControl *isHappySegm;
@property (strong, nonatomic) IBOutlet UIButton *ProfileBtn;

@property (nonatomic, retain) HappyHomeViewController *homeVC;
@property (nonatomic, retain) HappyRemindersViewController *remVC;
@property (nonatomic, retain) HappyScoreViewController *scoreVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIImageView *relationshipPicker;
@property (weak, nonatomic) IBOutlet UILabel *selectRelationshipLabel;


#pragma mark -
#pragma mark -Picker Popup Section
@property (weak, nonatomic) IBOutlet UIButton *selectRelationshipButton;
@property (weak, nonatomic) IBOutlet UIImageView *pickerBackgroundView;
@property (weak, nonatomic) IBOutlet UIButton *doneWithPickerButton;
@property (weak, nonatomic) IBOutlet UITextField *relationshipStatusText;

@property (nonatomic, retain) HappyOptions *happyOptions;

#pragma mark -
#pragma mark - Main Action Section
- (IBAction)CommentOnStatus:(id)sender;
- (IBAction)Reminders:(id)sender;
- (IBAction)Score:(id)sender;
- (IBAction)Challenge:(id)sender;
- (IBAction)Home:(id)sender;
- (IBAction)doneAction:(id)sender;


#pragma -mark
#pragma Picker Pop Up Section
- (IBAction)selectRelationshipAction:(id)sender;
- (IBAction)doneWithPicker:(id)sender;


@end

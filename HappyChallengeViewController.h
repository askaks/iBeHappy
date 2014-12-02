//
//  HappyChallengeViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <libxml/HTMLparser.h>

#import "HappyProfile.h"
#import "DailyChallenge.h"
#import "Task.h"

#import "HappyBioViewController.h"
#import "HappyHomeViewController.h"
#import "HappyScoreViewController.h"
#import "HappyChallengeViewController.h"
#import "HappyRemindersViewController.h"

#import "ChallengeTaskButton.h"

@class HappyBioViewController;
@class HappyHomeViewController;
@class HappyScoreViewController;
@class HappyChallengeViewController;
@class HappyRemindersViewController;
@class HappyHelpViewController;


@interface HappyChallengeViewController : UIViewController <NSXMLParserDelegate> {

    HappyProfile *profile;

    HappyBioViewController *bioVC;
    HappyHomeViewController *homeVC;
    HappyScoreViewController *scoreVC;
    HappyChallengeViewController *challengeVC;
    HappyRemindersViewController *remVC;
    
    
    
    NSInteger index;
    int onChallenge;
    NSDate *onDate;

}

@property (nonatomic, retain) HappyProfile *profile;
@property (nonatomic, retain) DailyChallenge *challenge;
@property (nonatomic, retain) Task *task;

@property (strong, retain) NSDate *onDate;

@property (nonatomic, retain) HappyBioViewController *bioVC;
@property (nonatomic, retain) HappyHomeViewController *homeVC;
@property (nonatomic, retain) HappyScoreViewController *scoreVC;
@property (nonatomic, retain) HappyChallengeViewController *challengeVC;
@property (nonatomic, retain) HappyRemindersViewController *remVC;
@property (nonatomic, retain) HappyHelpViewController *helpVC;
@property (strong, nonatomic) IBOutlet UITextView *challengeText;

////////////////////////////////////////////////////////
//
// Reading Challenges.xml
//
@property (nonatomic, retain) NSMutableArray *challenges;
//@property (nonatomic, retain) NSString *challengeTitle;
@property (nonatomic, assign) int onChallenge;
@property (nonatomic, retain) NSString *taskString;
@property (nonatomic, retain) NSMutableArray *tasks;

@property (nonatomic, retain) NSString *messageString;
@property NSInteger language;
@property NSInteger minimumRiskFactor;
@property NSInteger points;
@property NSInteger taskPoints;

@property NSMutableString *ageMin;
@property NSMutableString *ageMax;
@property (nonatomic, retain) NSMutableArray *genderExclude;

@property (nonatomic, retain) NSMutableArray *interestedInExclude;

@property (nonatomic, retain) NSMutableArray *workLevelExclude;
@property (nonatomic, retain) NSString *workHappyExclude;

@property (nonatomic, retain) NSMutableArray *schoolLevelExclude;
@property (nonatomic, retain) NSString *schoolHappyExclude;

@property (nonatomic, retain) NSMutableArray *relatationshipLevelExclude;
@property (nonatomic, retain) NSString *relationshipHappyExclude;



@property (nonatomic, retain) NSMutableArray *pet;
@property (nonatomic, retain) NSMutableArray *kid;
@property (nonatomic, retain) NSString *personality;


@property (nonatomic, assign) NSInteger index;
@property NSInteger taskCounter;
@property NSInteger schoolCounter;
@property NSInteger workCounter;
@property NSInteger relationshipCounter;

@property (weak, nonatomic) IBOutlet UILabel *forPointsLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointsEarnedLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *completedChallengeSegment;
@property (weak, nonatomic) IBOutlet UIView *fullTaskView;
@property (weak, nonatomic) IBOutlet UITextView *fullTaskText;
@property (weak, nonatomic) IBOutlet UIButton *closeFullTaskText;
@property (weak, nonatomic) IBOutlet ChallengeTaskButton *doneFullTaskButton;
@property (weak, nonatomic) IBOutlet UIButton *challengeCompletedButton;
@property (weak, nonatomic) IBOutlet UILabel *challengeTitleLabel;


@property bool completedGatheringChallenges;
@property NSInteger countOfChallenges;
@property enum status {profileProblem, challengesProblem, good, otherProblem};
//@property enum status currentStatus;
@property (weak, nonatomic) IBOutlet UILabel *challengeStatusLabel;
@property (weak, nonatomic) IBOutlet UITextView *challengeStatusText;

- (IBAction)goBack;
- (IBAction)Profile:(id)sender;
- (IBAction)Home:(id)sender;
- (IBAction)Score:(id)sender;
- (IBAction)Reminders:(id)sender;
- (IBAction)Help:(id)sender;
- (IBAction)isCompletedChange:(id)sender;

//- (BOOL)shouldAddChallenge;

- (void)shuffle;

@end

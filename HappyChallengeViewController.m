
//
//  HappyChallengeViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappyChallengeViewController.h"

#import <Parse/Parse.h>

#include <libxml/parser.h>


@interface HappyChallengeViewController ()

@end

@implementation HappyChallengeViewController

@synthesize profile;
@synthesize challenge;
@synthesize task;

@synthesize bioVC;
@synthesize homeVC;
@synthesize scoreVC;
@synthesize challengeVC;
@synthesize remVC;
@synthesize helpVC;
@synthesize challengeText;

@synthesize challenges;
@synthesize title;
@synthesize tasks;
@synthesize taskString;
@synthesize messageString;
@synthesize ageMax;
@synthesize ageMin;

@synthesize genderExclude;
@synthesize interestedInExclude;
@synthesize workHappyExclude;
@synthesize workLevelExclude;
@synthesize schoolHappyExclude;
@synthesize schoolLevelExclude;
@synthesize relatationshipLevelExclude;
@synthesize relationshipHappyExclude;
@synthesize completedChallengeSegment;

@synthesize language;
@synthesize pet;
@synthesize personality;
@synthesize kid;
@synthesize minimumRiskFactor;

@synthesize index;
@synthesize taskCounter;
@synthesize schoolCounter;
@synthesize relationshipCounter;
@synthesize workCounter;

@synthesize points;
@synthesize taskPoints;

@synthesize forPointsLabel;

@synthesize onChallenge;
@synthesize onDate;

@synthesize pointsEarnedLabel;

@synthesize fullTaskView;
@synthesize fullTaskText;
@synthesize closeFullTaskText;
@synthesize doneFullTaskButton;

- (NSString *)xmlPath {
    
    ///////////////////////////////////////////////////////////
    //
    // xml local file
    //
    //NSString *docDir = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Challenges.xml"];
    
    ///////////////////////////////////////////////////////////
    //
    // xml on server location
    //
    NSString *docDir = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Challenges.xml"];
    
	return docDir;
}

- (IBAction)goBack 
{
	//[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
//    [Utility archiveProfile:profile];
}







#pragma mark - ViewControllers Loading
- (IBAction)Profile:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
	
    if (nil == bioVC) {
        bioVC = [storyboard instantiateViewControllerWithIdentifier:@"505"];
	}
    
    bioVC.profile = profile;
	
	// viewDidLoad will be called
	//[self presentModalViewController:(UIViewController *)bioVC animated:YES];
    [self presentViewController:bioVC animated:YES completion:nil];
	self.bioVC = nil;
}

- (IBAction)Home:(id)sender
{
	if (nil == homeVC) {
		homeVC = [[HappyHomeViewController alloc] initWithNibName:@"HappyHomeViewController"
                                                           bundle:nil];
	}
	
    homeVC.profile = profile;
    
	// viewDidLoad will be called
	[self presentViewController:homeVC animated:YES completion:nil];
	
	self.homeVC = nil;
}

- (IBAction)Score:(id)sender
{
	if (nil == scoreVC) {
		scoreVC = [[HappyScoreViewController alloc] initWithNibName:@"HappyScoreViewController"
                                                             bundle:nil];
	}
	
    scoreVC.profile = profile;
    
	// viewDidLoad will be called
	[self presentViewController:scoreVC animated:YES completion:nil];
	
	self.scoreVC = nil;
}

- (IBAction)Reminders:(id)sender
{
	if (nil == remVC) {
		remVC = [[HappyRemindersViewController alloc] initWithNibName:@"HappyRemindersViewController"
                                                               bundle:nil];
	}
    
    remVC.profile = profile;
	
	// viewDidLoad will be called
	//[self presentModalViewController:remVC animated:YES];
    [self presentViewController:remVC animated:YES completion:nil];
	self.remVC = nil;
}

- (IBAction)Help:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
	
    if (nil == helpVC) {
        helpVC = [storyboard instantiateViewControllerWithIdentifier:@"805"];
	}
    
	// viewDidLoad will be called
	//[self presentModalViewController:(UIViewController *)helpVC animated:YES];
    helpVC.profile = self.profile;
    helpVC.fromScreen = @"Challenge";
    [self presentViewController:helpVC animated:YES completion:nil];
	self.helpVC = nil;
}










#pragma mark - ViewController Setup

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
- (void)viewDidLoad
{
//    [_eventStore requestAccessToEntityType:EKEntityTypeReminder
//                                completion:^(BOOL granted, NSError *error) {
//                                    if (!granted)
//                                        NSLog(@"Access to store not granted");
//                                }];
    bool challengesLoadedCorrectly = false;
    [super viewDidLoad];
    
    //If no profile then don't attempt to load challenges
    if(profile == nil || !profile.profileCompleted)
    {
        [self doBasicChallengeUISetup:profileProblem];
    }
    
    //if profile already has challenges loaded, startChallenge
    else if (profile.challenges != nil && profile.challenges.count > 0)
    {
        challengesLoadedCorrectly = true;
    }
    //Fetch Challenges from Parse
    else
    {
        challengesLoadedCorrectly = [self pullChallengesFromParse];
        [self shuffle];
    }
    
    //at this point profile should have all challenges loaded
    if(challengesLoadedCorrectly)
    {
        bool challengeForToday = false;
        NSString *nowString = [self todaysMonthDayString];
        if(![nowString isEqualToString:profile.currentChallengeDate])
        {
            if([self getNewChallengeForToday])
            {
                challengeForToday = true;
            }
        }
        else
        {
            challengeForToday = true;
        }
        if(challengeForToday)
        {
            [self doBasicChallengeUISetup:good];
            [self displayTodaysChallenge];
            [Utility archiveProfile:profile];
        }
    }
    else
    {
        [self doBasicChallengeUISetup:challengesProblem];
    }
}
- (void)displayTodaysChallenge
{
    //NSString *text;
    //text = [NSString stringWithFormat:@"Challenges for day: profile.currentChallengeDate"];

//    int rec = [profile.todaysChallenge.tasks count];
//    if (rec > 0)
//    {
//        for (int i=0; i<rec; i++)
//        {
//            Task *tk = [profile.todaysChallenge.tasks objectAtIndex:i];
//            //text = [[NSString alloc] initWithFormat:@"%@\n(%d) %@", text, i+1, tk.message];
//        }
//    }
    if(profile.todaysChallenge.completed)
    {
        [self doChallengeCompletedUISetup];
    }
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)viewDidUnload
{
    [self setChallengeText:nil];
    [self setForPointsLabel:nil];
    [self setPointsEarnedLabel:nil];
    [self setCompletedChallengeSegment:nil];
    [self setFullTaskView:nil];
    [self setFullTaskText:nil];
    [self setCloseFullTaskText:nil];
    [self setDoneFullTaskButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


#pragma mark - UI Setup
- (void)doBasicChallengeUISetup:(enum status) displayStatus
{
    if(displayStatus == profileProblem)
    {
        self.challengeTitleLabel.text = @"No Challenge Loaded";
        self.forPointsLabel.text = @"Points Worth: 0";
        self.pointsEarnedLabel.text = @"Points Earned: 0";
        self.challengeStatusText.text = @"No Challenges Loaded because your profile is incomplete!";
        //self.challengeStatusText. = true;
        self.challengeStatusText.hidden = false;
    }
    if(displayStatus == challengesProblem)
    {
        self.challengeTitleLabel.text = @"No Challenges Loaded";
        self.forPointsLabel.text = @"Points Worth: 0";
        self.pointsEarnedLabel.text = @"Points Earned: 0";
        self.challengeStatusText.text = @"There was a problem loading your challenges - try setting up your profile again!";
        //self.challengeStatusText.enabled = true;
        self.challengeStatusText.hidden = false;
    }
    else
    {
        self.challengeStatusText.hidden = true;
        self.challengeTitleLabel.text = profile.todaysChallenge.title;
        self.forPointsLabel.text = [NSString stringWithFormat:@"For %ld points:", (long)profile.todaysChallenge.pointsWorth];
    }
}
//This is called initially on a ViewLoad and each time a task is completed
- (void)doChallengeCompletedUISetup
{
//    CGFloat fixedWidth = self.challengeStatusText.frame.size.width;
//    CGFloat fixedHeight = self.challengeStatusText.frame.size.height;
    UIImage *checkImage = [UIImage imageNamed:@"CheckIcon.png"];
    self.challengeCompletedButton.enabled = true;
    [self.challengeCompletedButton setImage:checkImage forState:normal];
    self.challengeStatusText.hidden = false;
    self.challengeStatusText.text = @"Challenge Completed!";
    //self.challengeStatusText.textColor = [UIColor blueColor];

    //[self.challengeStatusText sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    //[self.challengeStatusText sizeThatFits:<#(CGSize)#>
    self.pointsEarnedLabel.text = [NSString stringWithFormat:@"Points Earned: %ld ", (long)(profile.todaysChallenge.pointsWorth - profile.todaysChallenge.pointsLeft)];
}
- (void)doChallengeStillIncompleteUISetup
{
    self.pointsEarnedLabel.text = [NSString stringWithFormat:@"Points Earned: %ld ", (long)(profile.todaysChallenge.pointsWorth - profile.todaysChallenge.pointsLeft)];
}
- (void)doChallengeUncompletedUISetup
{
    [self.challengeCompletedButton setImage:NULL forState:normal];
    self.challengeCompletedButton.enabled = true;
    self.challengeStatusText.hidden = true;
    self.pointsEarnedLabel.text = [NSString stringWithFormat:@"Points Earned: %ld ", (long)(profile.todaysChallenge.pointsWorth - profile.todaysChallenge.pointsLeft)];
}

#pragma mark - Loading Challenges into ChallengeViewController
- (void)scheduleTaskNotification:(Task*)tsk
{
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"];
    NSDate *date = [dateFormat dateFromString:tsk.time];
    localNotif.fireDate =date;
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    
    // Notification details
    localNotif.alertBody = tsk.message;
    // Set the action button
    localNotif.alertAction = @"View";
    
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 0;
    
    // Specify custom data for the notification
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
    localNotif.userInfo = infoDict;
    
    // Schedule the notification
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    //[localNotif release];
}

- (BOOL)getNewChallengeForToday
{
    bool isChallengeAvailable = false;
    NSString *nowString = [self todaysMonthDayString];
    
    int max = [profile.challenges count];
    
    if (max > 0)
    {
        if (![profile.currentChallengeDate isEqualToString:nowString])
        {
            if(profile.todaysChallenge != nil && !profile.todaysChallenge.completed)
            {
                //readd to list of challenges
                [profile.challenges addObject:profile.todaysChallenge];
            }
            profile.currChallengeIndex ++;
            profile.currentChallengeDate = nowString;
            profile.numOfViewedChallenges++;
        
            profile.todaysChallenge = [profile.challenges objectAtIndex:profile.currChallengeIndex];
            
            if(![profile.todaysChallenge isEqual:NULL])
            {
                isChallengeAvailable = true;
            }
            profile.maximumPossibleScore += profile.todaysChallenge.pointsLeft;
            //Notifications
            for(Task *tsk in profile.todaysChallenge.tasks)
            {
                NSDate *now = [[NSDate alloc] init];
                NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
                NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
                components = [calendar components: NSCalendarUnitYear | NSCalendarUnitMonth|NSCalendarUnitDay | NSHourCalendarUnit|NSMinuteCalendarUnit fromDate:now];
                NSInteger mins = [components minute];
                [components setMinute:(mins + 3)];
                NSString *nowString;

                NSDateFormatter *dateFormat;
                dateFormat = [[NSDateFormatter alloc] init];
                [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"]; // has to be same format
                nowString = [dateFormat stringFromDate:[calendar dateFromComponents:components]];
                tsk.time = nowString;
                [self scheduleTaskNotification:tsk];
            }

//            profile.notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:120.0];
//            profile.notification.alertBody = profile.todaysChallenge.description;
//            profile.notification.hasAction = true;
//            profile.notification.timeZone = [NSTimeZone localTimeZone];
        }
    }
    return isChallengeAvailable;
}


- (NSString *)todaysMonthDayString
{
    NSString *nowString;
    NSDate *now = [[NSDate alloc] init];
    NSDateFormatter *dateFormat;
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMMM d"]; // has to be same format
    nowString = [dateFormat stringFromDate:now];
    return nowString;
}



int randomSort(id obj1, id obj2, void *context ) {
    // returns random number -1 0 1
    int i = (random()%3 - 1);
    return i;
}

- (void)shuffle {
    int i = 0;
    for (DailyChallenge * daily in profile.challenges) {
        NSLog(@" #%d has index %@", i, daily.title);
        i++;
    }
    // call custom sort function
    [profile.challenges sortUsingFunction:randomSort context:nil];
    //[profile.challenges sortUsingFunction:<#(NSInteger (*)(__strong id, __strong id, void *))#> context:<#(void *)#>
    // show in log how is our array sorted
    i = 0;
    for (DailyChallenge * daily in profile.challenges) {
    	NSLog(@" #%d has index %@", i, daily.title);
    	i++;
    }
}

#pragma mark - Loading Challenges From Parse

-(BOOL) pullChallengesFromParse {
    
    bool atLeastOneChallengePulledCorrectly = false;
    NSString *sexPrefix = [[profile.sex substringToIndex:1] capitalizedString ];
    NSString *seekingPrefix = [[profile.seeking substringToIndex:1] capitalizedString ];
    
    PFQuery *challengesQuery = [PFQuery queryWithClassName:@"Challenges"];
    [challengesQuery whereKey:@"ageMin" lessThan:[NSNumber numberWithInteger:profile.age]];
    [challengesQuery whereKey:@"ageMax" greaterThan:[NSNumber numberWithInteger:profile.age]];
    [challengesQuery whereKey:@"languageRating" lessThanOrEqualTo:[NSNumber numberWithInteger:profile.language]];
    [challengesQuery whereKey:@"riskFactor" lessThanOrEqualTo:[NSNumber numberWithInteger:profile.personality]];
    [challengesQuery whereKey:@"forSex" containsString:sexPrefix];
    [challengesQuery whereKey:@"seekingWho" containsString:seekingPrefix];
    [challengesQuery whereKey:@"eduIncludes" containsString:profile.education];
    [challengesQuery whereKey:@"relationshipIncludes" containsString:profile.relation];
    [challengesQuery whereKey:@"incomeIncludes" containsString:profile.income];
    [challengesQuery whereKey:@"childIncludes" containsString:profile.kids];
    [challengesQuery whereKey:@"petIncludes" containsString:profile.pets];
    NSArray *objects = nil;
    objects = [challengesQuery findObjects];
    if (objects != NULL)
    {
        profile.challenges = [[NSMutableArray alloc] init];
        for (PFObject *challengeObj in objects)
        {
                //Now pull appropriate tasks
            DailyChallenge *dChallenge = [self createChallenge:challengeObj];
            if (dChallenge != NULL && dChallenge.tasks != nil && dChallenge.tasks.count > 0) {
                atLeastOneChallengePulledCorrectly = true;
                [profile.challenges addObject:dChallenge];
            }

        }
    }
        // The find succeeded. The first 100 objects are available in object
    else
    {
            // Log details of the failure
        NSLog(@"Error: Objects null");
    }
    return atLeastOneChallengePulledCorrectly;
}

-(DailyChallenge*) createChallenge:(PFObject *) challengeObject {
    
    PFObject *titleObs = challengeObject[@"title"];
    NSNumber *pointTotalObs = challengeObject[@"points"];
    NSLog(@"Challenge Title: %@", titleObs);
    //NSLog(@"pointTotalObs: %@", pointTotalObs);
    
    //created it
    challenge = [[DailyChallenge alloc] init];
    challenge.title = (NSString *)titleObs;
    challenge.pointsLeft = [pointTotalObs integerValue];
    challenge = [self findAndAddTasks:challengeObject:challenge];
    return challenge;
    //Now we add tasks since we know this is an appropriate challenge
}

-(DailyChallenge*) findAndAddTasks:(PFObject *) challengeObject :(DailyChallenge *) dailyChallenge {
    NSLog(@"Title of Challenge to Get Tasks of: %@", dailyChallenge.title);
    PFQuery *taskQuery = [PFQuery queryWithClassName:@"Tasks"];
    //PFObject *challengeid = challengeObject[@"objectId"];
    //[taskQuery whereKey:@"parentChallenge" equalTo:(NSString*)(challengeid)];
    [taskQuery whereKey:@"parentChallenge" equalTo:challengeObject];
    NSArray *objects = [taskQuery findObjects]; //]:^(NSArray *objects, NSError *error){
    dailyChallenge.tasks = [[NSMutableArray alloc] init];
    dailyChallenge.pointsLeft = 0;
    if (objects != NULL || objects.count == 0)
    {
        for (PFObject *objTasks in objects)
        {
            NSString *actionObj = objTasks[@"action"];
            NSNumber *pointObj = objTasks[@"points"];
            NSLog(@"ageMinObs: %@", actionObj);
            Task *task1  = [[Task alloc] initWithMessageAndPoints:actionObj points:[pointObj integerValue]];
            dailyChallenge.pointsLeft += task1.points;
            [dailyChallenge.tasks addObject:task1];
        }
    }
        // The find succeeded. The first 100 objects are available in object
    else
    {
        // Log details of the failure
        if(objects == NULL)
        {
            NSLog(@"Error: NULL Objects");
        }
        else
        {
            NSLog(@"0 OBJECTS");
        }
    }
    return dailyChallenge;
    
}





//- (IBAction)isCompletedChange:(id)sender {
//      if (completedChallengeSegment.selectedSegmentIndex == 0) {
//        profile.score += profile.todaysChallenge.pointsLeft;
//        self.pointsEarnedLabel.text = [NSString stringWithFormat:@"Points just earned: %d", profile.todaysChallenge.pointsLeft];
//     //profile.todaysChallenge.completed = true;
//          profile.numOfCompletedChallenges += 1;
//          [self doChallengeCompletedUISetup];
////          self.challengeStatusLabel.hidden = false;
////          self.challengeStatusLabel.text = @"Challenge Completed!";
////          self.challengeStatusLabel.textColor = [UIColor blueColor];
//      }
//      else
//    {
//        profile.numOfCompletedChallenges -= 1;
//         //profile.todaysChallenge.completed = false;
//          profile.score -= profile.todaysChallenge.pointsLeft;
//          self.pointsEarnedLabel.text = [NSString stringWithFormat:@"Points earned: 0"];
//        [self doChallengeIncompletedUISetup];
//          //self.challengeStatusLabel.hidden = true;
//      }
//}

//- (BOOL)shouldAddChallenge
//{
//    
//    NSDate *now = [[NSDate alloc] init];
//    NSDateFormatter *dateFormat;
//    dateFormat = [[NSDateFormatter alloc] init];
//    [dateFormat setDateFormat:@"MMMM d, yyyy"];
//    
//    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//
//    NSDateComponents *components = [gregorianCalendar components: (NSYearCalendarUnit )
//                                                        fromDate:profile.birthDay
//                                                          toDate:now                                                         options:nil];
//   NSInteger currentAge = [components year];
//    
//    bool addChallenge = true;
//    if (challenge.ageMax.intValue < currentAge) {
//        addChallenge = false;
//    }
//    else if (challenge.ageMin.intValue > currentAge) {
//        addChallenge = false;
//    }
//    
//    else if([challenge.genderExcludes containsObject:profile.sex])
//    {
//        addChallenge = false;
//    }
//    else if([challenge.interestedInExcludes containsObject:profile.seeking])
//    {
//        addChallenge = false;
//    }
//    
//    else if([challenge.schoolHappyExcludes containsObject:profile.keepStudying])
//    {
//        addChallenge = false;
//    }
//    else if([challenge.schoolLevelExcludes containsObject:profile.education])
//    {
//        addChallenge = false;
//    }
//    else if([challenge.workLevelExcludes containsObject:profile.income])
//    {
//        addChallenge = false;
//    }
//    else if([challenge.workHappyExcludes containsObject:profile.jobAttitude])
//    {
//        addChallenge = false;
//    }
//    else if([challenge.relationshipExcludes containsObject:profile.relation])
//    {
//        addChallenge = false;
//    }
//    else if([challenge.happyWithRelationship isEqual:profile.relationshipContentment])
//    {
//        addChallenge = false;
//    }
//    else if([challenge.kidsExclude containsObject:profile.kids])
//    {
//        addChallenge = false;
//    }
//    else if([challenge.petsExclude containsObject:profile.pets])
//    {
//        addChallenge = false;
//    }
//    return addChallenge;
//}

#pragma mark -
#pragma mark Tasks: Table view data source

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
    // Return the number of sections.
    return 1; // only 1
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [profile.todaysChallenge.tasks count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"PlayerCell" owner:self options:nil] lastObject];
    // Configure the cell...
	int i = (int)indexPath.row;
    UITextView *score = (UITextView *)[cell viewWithTag:603];
    index = i;
    ChallengeTaskButton* chbutton =  (ChallengeTaskButton *) [cell viewWithTag:606];
    chbutton.taskNumber = i;
    [chbutton addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
    
    ChallengeTaskButton* allTaskButton =  (ChallengeTaskButton *) [cell viewWithTag:222];
    allTaskButton.taskNumber = i;
    [allTaskButton addTarget:self action:@selector(allTaskViewAction:) forControlEvents:UIControlEventTouchUpInside];
    
    Task *task1 = [profile.todaysChallenge.tasks objectAtIndex:i];

    //Expression result seems to be used in delegate...
    score.text = (@"Task %d : %s",i, task1.message);
    if(task1.completed)
    {
        UIImage *checkImage = [UIImage imageNamed:@"CheckIcon.png"];
        [chbutton setImage:checkImage forState:normal];
    }
    
    
    NSString *pointsDisplay = [NSString stringWithFormat:@"(%ld)", (long)task1.points];
    UILabel *pointsLabel = (UILabel *)[cell viewWithTag:111];
    pointsLabel.text = pointsDisplay;
    pointsLabel.textColor = [UIColor orangeColor];
    pointsLabel.font = [UIFont boldSystemFontOfSize:16.0];
    [cell addSubview:pointsLabel];
    //self.pointsEarnedLabel.text = [NSString stringWithFormat:@"Points earned: %d", profile.score];
    return cell;
}

-(IBAction)allTaskViewAction:(id)sender{
    
    fullTaskView.hidden = false;
    closeFullTaskText.hidden = false;
    [closeFullTaskText addTarget:self action:@selector(closeTextView:) forControlEvents:UIControlEventTouchDown];
    ChallengeTaskButton *chbutton = (ChallengeTaskButton *)sender;
    NSInteger taskNum = chbutton.taskNumber;
    NSLog(@"Selected row is: %zd",taskNum);
    Task *task1 = [profile.todaysChallenge.tasks objectAtIndex:taskNum];
    
    fullTaskText.text = task1.message;
}
-(IBAction)closeTextView:(id)sender{
    fullTaskView.hidden = true;;
    closeFullTaskText.hidden = true;
    doneFullTaskButton.hidden = true;
}

- (void)taskUncompleted:(Task *)task1 chbutton:(ChallengeTaskButton *)chbutton {
    task1.completed = false;
    [chbutton setImage:NULL forState:normal];
    profile.score -= task1.points;
    profile.todaysChallenge.pointsLeft += task1.points;
    [self doChallengeUncompletedUISetup];
}

- (void)taskCompleted:(Task *)task1 checkImage:(UIImage *)checkImage chbutton:(ChallengeTaskButton *)chbutton {
    task1.completed = true;
    [chbutton setImage:checkImage forState:normal];
    profile.score += task1.points;
    profile.todaysChallenge.pointsLeft -= task1.points;
    if(profile.todaysChallenge.completed)
    {
        [self doChallengeCompletedUISetup];
    }
    else
    {
        [self doChallengeStillIncompleteUISetup];
    }
}

-(IBAction)myAction:(id)sender{

    ChallengeTaskButton *chbutton = (ChallengeTaskButton *)sender;
    int taskNum = chbutton.taskNumber;
    NSLog(@"Selected row is: %d",taskNum);
    UIImage *checkImage = [UIImage imageNamed:@"CheckIcon.png"];
    Task *task1 = [profile.todaysChallenge.tasks objectAtIndex:taskNum];
    
    if(task1.completed)
    {
        [self taskUncompleted:task1 chbutton:chbutton];
    }
    else
    {
        [self taskCompleted:task1 checkImage:checkImage chbutton:chbutton];
//        if(profile.todaysChallenge.pointsLeft <= 0)
//        {
//            //profile.todaysChallenge.completed = true;
//            //profile.numOfCompletedChallenges += 1;
//            completedText = @"CHALLENGE COMPELETED";
//            [self.challengeCompletedButton setImage:checkImage forState:normal];
//             //self.pointsEarnedLabel.text = [NSString stringWithFormat:@"Points earned: %d", profile.score];
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Challenge Completed"
//                                                            message:@"Congratulations, you have completed today's challenge!  Next challenge tomorrow!"
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles: nil];
//            [alert show];
//        }
        
//        if(profile.score >= 1000)
//        {
//            //profile.relationshipContentment = @"yes";
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Next Level"
//                                                            message:@"Congratulations, you have reached 1000 points!  Go to Next Level on your Home Screen to access your next level of challenges."
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles: nil];
//            [alert show];
//        }
//        else if(profile.numOfCompletedChallenges >= 30)
//        {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Next Level"
//                                                            message:@"Congratulations, you have completed 30 challenges!  Go to Next Level on your Home Screen to access your next level of challenges."
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles: nil];
//            [alert show];
//            
//        }
        
    }
//    self.pointsEarnedLabel.text = [NSString stringWithFormat:@"Points earned: %d %@", profile.score, completedText];
}




@end

//
//  HappyProfile.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DailyChallenge.h"
enum ANS {
    na = -1,
    no = 0,
    yes = 1,
    both = 2
};

@interface HappyProfile : NSObject <NSCoding, NSCopying>


@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *name;

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, retain) NSString *sex;
@property (nonatomic, retain) NSString *income;
@property (nonatomic, retain) NSString *relation;
@property (nonatomic, retain) NSString *education;
@property (nonatomic, retain) NSString *location;

@property (nonatomic, retain) NSDate *birthDay;
@property (nonatomic, retain) NSString *seeking;
@property (nonatomic, retain) NSString *jobAttitude;
@property (nonatomic, retain) NSString *relationshipContentment;
@property (nonatomic, retain) NSString *keepStudying;
@property (nonatomic, retain) NSString *currentChallengeDate;

@property (nonatomic, retain) NSString *kids;
@property (nonatomic, retain) NSString *pets;

@property (nonatomic, assign) NSInteger personality;
@property (nonatomic, assign) NSInteger language;
@property (nonatomic, assign) NSInteger happiness;

@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger maximumPossibleScore;
@property (nonatomic, assign) NSInteger currChallengeIndex;
//@property (nonatomic, assign) NSInteger numOfCompletedChallenges;
@property (nonatomic, assign) NSInteger numOfViewedChallenges;
@property (nonatomic, assign) NSInteger level;

@property (nonatomic, retain) NSMutableArray *challenges;
@property (nonatomic, retain) DailyChallenge *todaysChallenge;

@property (nonatomic, retain) UILocalNotification *notification;
@property bool remindersOn;
@property bool profileCompleted;
@property (getter=getNumOfCompletedChallenges, readonly) NSInteger numOfCompletedChallenges;

- (void)encodeWithCoder: (NSCoder *)encoder;
- (id)initWithCoder: (NSCoder *)decoder;

- (id)initWithName: (NSString *)sName 
               day: (NSString *)sDay
              type: (NSString *)sType
               sex: (NSString *)sSex;

- (id)initWithType: (NSString *)type;

- (void)restartChallenges;
-(NSString *)writeoutProfile;

@end

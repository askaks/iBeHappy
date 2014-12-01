//
//  DailyChallenge.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 1/23/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Task.h"

@interface DailyChallenge : NSObject <NSCoding, NSCopying> 
//{
//    NSString *title;          // int
//    NSMutableArray *tasks;  // tasks
//    NSString *ageMin;
//    NSString *ageMax;
//
//    NSMutableArray *genderExcludes;  // tasks
//    NSMutableArray *interestedInExcludes;  // tasks
//    
//    NSMutableArray *workLevelExcludes;  // tasks
//    NSMutableArray *workHappyExcludes;  // tasks
//    
//    NSMutableArray *schoolLevelExcludes;  // tasks
//    NSMutableArray *schoolHappyExcludes;  // tasks
//    
//    NSMutableArray *relationshipLevelExcludes;  // tasks
//    NSMutableArray *relationshipHappyExcludes;  // tasks
//    
//    NSMutableArray *kidsExclude;  // tasks
//    NSMutableArray *petsIndlude;  // tasks
//    
//    NSInteger pointsWorth;
//    NSInteger minimumRiskFactor;
//    NSInteger language;
//    
//    bool completed;
//    
//}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *ageMin;
@property (nonatomic, retain) NSString *ageMax;


@property (nonatomic, retain) NSMutableArray *genderExcludes;

@property (nonatomic, retain) NSMutableArray *interestedInExcludes;

@property (nonatomic, retain) NSMutableArray *workLevelExcludes;
@property (nonatomic, retain) NSMutableArray *workHappyExcludes;

@property (nonatomic, retain) NSMutableArray *schoolLevelExcludes;
@property (nonatomic, retain) NSMutableArray *schoolHappyExcludes;

@property (nonatomic, retain) NSMutableArray *relationshipLevelExcludes;
@property (nonatomic, retain) NSMutableArray *relationshipHappyExcludes;

@property (nonatomic, retain) NSString *femaleExcl;
@property (nonatomic, retain) NSString *maleExcl;
@property (nonatomic, retain) NSString *schoolSpecific;
@property (nonatomic, retain) NSString *schoolLevel;
@property (nonatomic, retain) NSString *workSpecific;
@property (nonatomic, retain) NSString *workType;
@property (nonatomic, retain) NSString *relationshipSpecific;
@property (nonatomic, retain) NSString *happyWithWork;
@property (nonatomic, retain) NSString *continueStudying;
@property (nonatomic, retain) NSString *happyWithRelationship;
//@property (nonatomic, retain) NSString *language;

@property (nonatomic, retain) NSMutableArray *tasks;
@property (nonatomic, retain) NSMutableArray *relationshipExcludes;
@property (nonatomic, retain) NSMutableArray *schoolExcludes;
@property (nonatomic, retain) NSMutableArray *workExcludes;

@property (nonatomic, retain) NSMutableArray *kidsExclude;
@property (nonatomic, retain) NSMutableArray *petsExclude;
//@property (nonatomic, retain) NSMutableArray *personalityExclude;

@property (nonatomic, assign) NSInteger pointsLeft;
@property (nonatomic, assign) NSInteger minimumRiskFactor;
@property (nonatomic, assign) NSInteger language;

@property bool completed;

- (void)encodeWithCoder: (NSCoder *)encoder;
- (id)initWithCoder: (NSCoder *)decoder;

- (id)initWithDay: (NSString *)d
            tasks: (NSMutableArray *)array;

- (id)copyWithZone:(NSZone *)zone;


@end

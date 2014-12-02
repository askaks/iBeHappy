//
//  DailyChallenge.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 1/23/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "DailyChallenge.h"

@implementation DailyChallenge


- (void)encodeWithCoder: (NSCoder *)encoder 
{
    [encoder encodeObject:_title forKey: @"title"];
    
    [encoder encodeObject:_tasks forKey: @"tasks"];
    
    [encoder encodeObject:_ageMin forKey: @"min"];
    
	[encoder encodeObject:_ageMax forKey: @"max"];
    
    [encoder encodeObject:_genderExcludes forKey: @"genderExcludes"];
    
    [encoder encodeObject:_interestedInExcludes forKey: @"interestedInExcludes"];
    
    [encoder encodeObject:_schoolLevelExcludes forKey: @"schoolLevelExcludes"];

    [encoder encodeObject:_schoolHappyExcludes forKey: @"schoolHappyExcludes"];
   
    [encoder encodeObject:_workLevelExcludes forKey: @"workLevelExcludes"];
    
    [encoder encodeObject:_workHappyExcludes forKey: @"workHappyExcludes"];

    [encoder encodeObject:_relationshipLevelExcludes forKey: @"relationshipLevelExcludes"];

    [encoder encodeObject:_relationshipHappyExcludes forKey: @"relationshipHappyExcludes"];
    
    //[encoder encodeBool:_completed forKey:@"completed" ];

    [encoder encodeObject:_petsExclude forKey: @"petsExclude"];
    [encoder encodeObject:_kidsExclude forKey: @"kidsExclude"];
    
    [encoder encodeInteger:_minimumRiskFactor forKey: @"minimumRiskFactor"];
    [encoder encodeInteger:_language forKey: @"language"];
    
    [encoder encodeInteger:_pointsLeft forKey: @"pointsLeft"];
}

- (id)init
{
    self = [super init];
    
 	if (self) 
	{
        _title = @"No Challenges Loaded";
        _tasks = [[NSMutableArray alloc] init];
        _ageMax = [[NSString alloc] initWithFormat:@"%d", 0];
        _ageMin = [[NSString alloc] initWithFormat:@"%d", 0];

        _genderExcludes = [[NSMutableArray alloc] init];
        _interestedInExcludes = [[NSMutableArray alloc] init];
        
        _schoolHappyExcludes = [[NSMutableArray alloc] init];
        _schoolLevelExcludes = [[NSMutableArray alloc] init];
        
        _workHappyExcludes = [[NSMutableArray alloc] init];
        _workLevelExcludes =[[NSMutableArray alloc] init];
        
        _relationshipHappyExcludes = [[NSMutableArray alloc] init];
        _relationshipLevelExcludes = [[NSMutableArray alloc] init];

        _kidsExclude = [[NSMutableArray alloc] init];
        _petsExclude = [[NSMutableArray alloc] init];
        
        _language = 0;
        _minimumRiskFactor = 0;
        
        //_completed = false;
        _pointsLeft = 1000;
    }
	return self;
}

- (id)initWithCoder: (NSCoder *)decoder
{
    self = [super init];
    
	if (self) 
    {
        self.title = [decoder decodeObjectForKey:@"title"];
        self.tasks = [decoder decodeObjectForKey:@"tasks"];
        self.ageMin = [decoder decodeObjectForKey: @"min"];
		self.ageMax = [decoder decodeObjectForKey: @"max"];

        self.genderExcludes = [decoder decodeObjectForKey:@"genderExcludes"];

        self.interestedInExcludes = [decoder decodeObjectForKey:@"interestedInExcludes"];

        self.schoolLevelExcludes = [decoder decodeObjectForKey:@"schoolLevelExcludes"];

        self.schoolHappyExcludes = [decoder decodeObjectForKey:@"schoolHappyExcludes"];
        
        self.workLevelExcludes = [decoder decodeObjectForKey: @"workLevelExcludes"];
        
        self.workHappyExcludes = [decoder decodeObjectForKey: @"workHappyExcludes"];
        
        self.relationshipLevelExcludes = [decoder decodeObjectForKey: @"relationshipLevelExcludes"];
        
        self.relationshipHappyExcludes = [decoder decodeObjectForKey: @"relationshipHappyExcludes"];
        
        //self.completed = [decoder decodeBoolForKey:@"completed"];
        
        self.kidsExclude = [decoder decodeObjectForKey: @"kidsExclude"];
        
        self.petsExclude = [decoder decodeObjectForKey: @"petsExclude"];
        
        self.language = [decoder decodeIntegerForKey: @"language"];
        self.minimumRiskFactor = [decoder decodeIntegerForKey: @"minimumRiskFactor"];
        
        self.pointsLeft = [decoder decodeIntegerForKey: @"pointsLeft"];
    }
	return self;
}

- (id)initWithDay: (NSString *)d
            tasks: (NSMutableArray *)array
{
    self = [super init];
    
 	if (self) 
	{
        _title = d;
        _tasks = [[NSMutableArray alloc] initWithArray:array];
    }   
	return self;
}

- (id)copyWithZone:(NSZone *)zone
{
	DailyChallenge *challenge = [[DailyChallenge alloc] init];
    
    challenge.title = self.title;
    challenge.tasks = [self.tasks copy];
    challenge.ageMin = [NSString stringWithString:_ageMin];
	challenge.ageMax = [NSString stringWithString:_ageMax];
    
    challenge.genderExcludes = [self.genderExcludes copy];
    challenge.interestedInExcludes = [self.interestedInExcludes copy];
    
    challenge.schoolLevelExcludes = [self.schoolLevelExcludes copy];
    challenge.schoolHappyExcludes = [self.schoolHappyExcludes copy];
    
    challenge.workLevelExcludes = [self.workLevelExcludes copy];
    challenge.workHappyExcludes = [self.workHappyExcludes copy];
    
    challenge.relationshipLevelExcludes = [self.relationshipLevelExcludes copy];
    challenge.relationshipHappyExcludes = [self.relationshipHappyExcludes copy];
    
    //challenge.completed = self.completed;
    
    challenge.kidsExclude = [self.kidsExclude copy];
    challenge.petsExclude = [self.petsExclude copy];
    
    challenge.language = self.language;
    challenge.minimumRiskFactor = self.minimumRiskFactor;
    
    challenge.pointsLeft = self.pointsLeft;
    return challenge;
}
- (BOOL)isCompleted
{
    bool completed = false;
    for(Task *task in self.tasks)
    {
        if(task.completed)
        {
            completed = true;
        }
        else
        {
            completed = false;
            break;
        }
    }
     return completed;
}

-(NSInteger) getPointsWorth
{
    NSInteger pointTotal = 0;
    for(Task *task in self.tasks)
    {
        pointTotal += task.points;

    }
    return pointTotal;
    
}
@end

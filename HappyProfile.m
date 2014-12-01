//
//  HappyProfile.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappyProfile.h"

@implementation HappyProfile

- (void)encodeWithCoder: (NSCoder *)encoder 
{
    [encoder encodeObject:_type forKey: @"type"];
	[encoder encodeObject:_name forKey: @"name"];
	[encoder encodeInteger:_age forKey: @"age"];
	[encoder encodeObject:_sex forKey: @"sex"];
	[encoder encodeObject:_income forKey: @"income"];
	[encoder encodeObject:_relation forKey: @"relation"];
	[encoder encodeObject:_education forKey: @"education"];
    [encoder encodeObject:_birthDay forKey:@"birth"];
    [encoder encodeObject:_seeking forKey:@"seeking"];
    [encoder encodeObject:_jobAttitude forKey:@"jobAttitude"];
    [encoder encodeObject:_relationshipContentment forKey:@"relationshipContentment"];
    [encoder encodeObject:_keepStudying forKey:@"keepStudying"];
    [encoder encodeObject:_todaysChallenge forKey:@"todaysChallenge"];

    [encoder encodeObject:_kids forKey:@"kids"];
    [encoder encodeObject:_pets forKey:@"pets"];
    [encoder encodeInteger:_personality forKey:@"personality"];
    [encoder encodeInteger:_language forKey:@"language"];
    
    [encoder encodeInteger:_score forKey:@"score"];
    
    [encoder encodeInteger:_numOfViewedChallenges forKey:@"numOfViewedChallenges"];
    [encoder encodeInteger:_numOfCompletedChallenges forKey:@"numOfCompletedChallenges"];
    [encoder encodeInteger:_currChallengeIndex forKey:@"currChallengeIndex"];
    [encoder encodeInteger:_level forKey:@"level"];
    
    [encoder encodeBool:_remindersOn forKey:@"remindersOn"];
    [encoder encodeBool:_profileCompleted forKey:@"profileCompleted"];
    //NSLog(@"encodeWithCoder BEFORE currentChallengeDate %@",self.currentChallengeDate);
    [encoder encodeObject:_currentChallengeDate forKey:@"currentChallengeDate"];
    [encoder encodeObject:_notification forKey:@"notification"];
    
    [encoder encodeObject:_challenges forKey:@"challenges"];
    
    [encoder encodeObject:_location forKey:@"location"];
    [encoder encodeInteger:_happiness forKey:@"happiness"];
}

- (id)initWithCoder: (NSCoder *)decoder
{
    self = [super init];
    
	if (self) 
    {
        self.type = [decoder decodeObjectForKey: @"type"];
        //self.openness = [decoder decodeIntegerForKey: @"openness"];
        //self.language = [decoder decodeIntegerForKey: @"language"];
		self.name = [decoder decodeObjectForKey: @"name"];
		self.age = [decoder decodeIntegerForKey: @"age"];
		self.sex = [decoder decodeObjectForKey: @"sex"];
        //self.blood = [decoder decodeObjectForKey: @"blood"];
        self.income = [decoder decodeObjectForKey: @"income"];
        self.relation = [decoder decodeObjectForKey: @"relation"];
        self.education = [decoder decodeObjectForKey: @"education"];

        self.birthDay = [decoder decodeObjectForKey: @"birth"];
        self.seeking = [decoder decodeObjectForKey: @"seeking"];
        self.jobAttitude = [decoder decodeObjectForKey: @"jobAttitude"];
        self.relationshipContentment = [decoder decodeObjectForKey: @"relationshipContentment"];
        self.keepStudying = [decoder decodeObjectForKey: @"keepStudying"];
        self.todaysChallenge = [decoder decodeObjectForKey: @"todaysChallenge"];
        self.currentChallengeDate = [decoder decodeObjectForKey:@"currentChallengeDate"];
        self.score = [decoder decodeIntegerForKey:@"score"];
        self.remindersOn = [decoder decodeBoolForKey:@"remindersOn"];
        self.profileCompleted = [decoder decodeBoolForKey:@"profileCompleted"];
        self.level = [decoder decodeIntegerForKey:@"level"];
        self.numOfCompletedChallenges = [decoder decodeIntegerForKey:@"numOfCompletedChallenges"];
        self.numOfViewedChallenges = [decoder decodeIntegerForKey:@"numOfViewedChallenges"];
        self.currChallengeIndex = [decoder decodeIntegerForKey:@"currChallengeIndex"];
        
        self.notification = [decoder decodeObjectForKey:@"notification"];
        
        self.kids = [decoder decodeObjectForKey:@"kids"];
        self.pets = [decoder decodeObjectForKey:@"pets"];
        self.personality = [decoder decodeIntegerForKey:@"personality"];
        self.language = [decoder decodeIntegerForKey:@"language"];
        self.challenges = [decoder decodeObjectForKey: @"challenges"];
        
        self.location = [decoder decodeObjectForKey:@"location"];
        self.happiness = [decoder decodeIntegerForKey:@"happiness"];
    }    
	return self;
}

- (id)init
{
    self = [super init];
    
 	if (self)
	{
        _type = @"0.0";
		_name = @"No Profile Created";
		_age = 18;
		_sex = @"Female";
        _seeking = @"Males";
        _income = @"No Income Selected";
        _relation = @"No Relationship Selected";
        _education = @"No Education Selected";
        //reminders = @"YES";
        _currChallengeIndex = -1;
        _birthDay = [[NSDate alloc] init];
        _seeking = @"na";
        _jobAttitude = @"meh";
        _relationshipContentment = @"no";
        _keepStudying = @"yes";
        _score = 0;
        _challenges = nil;
        _todaysChallenge = nil;
        _remindersOn = false;
        _currentChallengeDate = @"1900,01,01";
        _notification  = [[UILocalNotification alloc] init];
        _kids = @"none";
        _pets = @"none";
        _language = 1;
        _personality = 1;
        _level = 0;
        _profileCompleted = false;
        _location = @"";
        _happiness = 5;
    }   
    
	return self;
}

- (id)initWithName: (NSString *)sName 
               day: (NSString *)sDay
              type: (NSString *)sType
               sex: (NSString *)sSex
{
    self = [super init];
    
 	if (self)
	{
        _type = [[NSString alloc] initWithString: sType];
        _personality = 5;
        _language = 5;
		_name = [[NSString alloc] initWithString: sName];
		_age = 18;
		_sex = [[NSString alloc] initWithString: sSex];
        _income = @"No Income Selected";
        _relation = @"No Relationship Selected";
        _education = @"No Education Selected";
        //reminders = @"YES";
        _currChallengeIndex = -1;
        _birthDay = [[NSDate alloc] init];
        _notification  = [[UILocalNotification alloc] init];
        _level = -1;
    }   
    
	return self;
}

- (id)copyWithZone:(NSZone *)zone
{

	HappyProfile *profile = [[HappyProfile alloc] init];
    profile.type = [NSString stringWithString:_type];
	profile.name = [NSString stringWithString:_name];
	profile.age = _age;
	profile.sex = [NSString stringWithString:_sex];
    profile.income = [NSString stringWithString:_income];
    profile.relation = [NSString stringWithString:_relation];
    profile.education = [NSString stringWithString:_education];
    //profile.reminders = [NSString stringWithString:reminders];
    profile.currChallengeIndex = self.currChallengeIndex;
    profile.birthDay = self.birthDay;
    profile.seeking = [NSString stringWithString:_seeking];
    profile.keepStudying = [NSString stringWithString:_keepStudying];
    profile.relationshipContentment = [NSString stringWithString:_relationshipContentment];
    profile.jobAttitude = [NSString stringWithString:_jobAttitude];
    profile.score = self.score;
    profile.challenges = [self.challenges copy];
    profile.todaysChallenge = [self.todaysChallenge copy];
    profile.remindersOn = self.remindersOn;
    profile.numOfViewedChallenges = self.numOfViewedChallenges;
    profile.numOfCompletedChallenges = self.numOfCompletedChallenges;
    
    profile.notification = self.notification;
    
    profile.currentChallengeDate = self.currentChallengeDate;
    
    profile.challenges = [self.challenges copy];
    
    NSLog(@"IN PROFILE currentChallengeDate copyWithZone %@",profile.currentChallengeDate);
    
    profile.kids = self.kids;
    profile.pets = self.pets;
    profile.language = self.language;
    profile.personality = self.personality;
   
    
    profile.level = self.level;
    
    profile.profileCompleted = self.profileCompleted;
    profile.location = self.location;
    profile.happiness = self.happiness;
    return profile;
}
- (void)restartChallenges
{
    self.currChallengeIndex = -1;
    self.score = 0;
    self.challenges = nil;
    self.todaysChallenge = nil;
    self.numOfViewedChallenges = 0;
    self.numOfCompletedChallenges = 0;
    self.currentChallengeDate = @"1900,01,01";
}

- (NSString *)writeoutProfile
{
    NSString * profileString;// = //[NSString stringWithFormat:@"%@ \n", self.name ];
    NSString * nameString = [NSString stringWithFormat:@"%@ \n", self.name ];
    NSString * location = [NSString stringWithFormat:@"Located in %@ \n", self.location];
    //NSDate *now = [[NSDate alloc] init];
    NSDateFormatter *dateFormat;
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMMM d"]; // has to be same format
    NSString *ageString = [dateFormat stringFromDate:self.birthDay];
    //NSString * ageString = [NSString stringWithFormat:@"%@ \n", self.birthDay];
    NSString * sexString = [NSString stringWithFormat:@"%@ \n", self.sex ];
    NSString * interestedInString = [NSString stringWithFormat:@"Interested in: %@s\n ", self.seeking];
    NSString * relationshipString = [NSString stringWithFormat:@"Relationship Status: %@", self.relation ];
    NSString * relationshipContentmentString = [NSString stringWithFormat:@" and %@... \n ", self.relationshipContentment];
    NSString * educationString = [NSString stringWithFormat:@"Education: %@ ", self.education];
    NSString * educationContentmentString = [NSString stringWithFormat:@" and %@... \n ", self.keepStudying];
    NSString * incomeString = [NSString stringWithFormat:@"Job: %@", self.income ];
    NSString * incomeContentmentString = [NSString stringWithFormat:@" and %@... \n ", self.jobAttitude];
    
    NSString * kidsString = [NSString stringWithFormat:@"Kids: %@ \n ", self.kids];
    NSString * petsString = [NSString stringWithFormat:@"Pets: %@ \n ", self.pets];
    
    NSString * languageSettingString = [NSString stringWithFormat:@"Bold Language Preferance: %d out of 10\n ", self.language];
    NSString * personalitySettingString = [NSString stringWithFormat:@"Bold Personality: %d out of 10 \n ", self.personality];
    
    NSString * happinessIndexString = [NSString stringWithFormat:@"Finally and most importantly your happiness index is : %d out of 10 \n ", self.happiness];
    
    profileString = [NSString stringWithFormat:@"@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@", nameString, ageString, location,sexString, interestedInString, relationshipString, relationshipContentmentString, educationString, educationContentmentString, incomeString, incomeContentmentString, kidsString, petsString, languageSettingString, personalitySettingString, happinessIndexString];
    return profileString;
}

@end

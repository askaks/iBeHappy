//
//  Task.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 1/23/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Task.h"

@implementation Task

- (void)encodeWithCoder: (NSCoder *)encoder 
{
    [encoder encodeObject:_message forKey: @"message"];
    [encoder encodeObject:_timeSpecific forKey: @"tspec"];
    [encoder encodeObject:_time forKey: @"time"];
    [encoder encodeInteger:_points forKey: @"points"];
	[encoder encodeBool:_completed forKey: @"completed"];
    [encoder encodeObject:(_reminderMessage) forKey:@"reminderMessage"];
}

- (id)initWithCoder: (NSCoder *)decoder
{
    self = [super init];
    
	if (self)
    {
        self.message = [decoder decodeObjectForKey: @"message"];
        self.timeSpecific = [decoder decodeObjectForKey: @"tspec"];
        self.time = [decoder decodeObjectForKey: @"time"];
        self.points = [decoder decodeIntegerForKey: @"points"];
        self.completed = [decoder decodeBoolForKey: @"completed"];
        self.reminderMessage = [decoder decodeObjectForKey: @"reminderMessage"];
    }    
	return self;
}

- (id)init
{
    self = [super init];
    
 	if (self)
	{
        _message = @"This would be your task";
        _time = [[NSString alloc] initWithFormat:@"%d", 0];
        _timeSpecific = @"false";
        _points =  25;
        _completed = false;
        _reminderMessage = @"NA";
    }
	return self;
}

- (id)initWithMessage:(NSString *)msg
{
    self = [super init];
    
 	if (self)
	{
        _message = [[NSString alloc] initWithString: msg];
        _time = [[NSString alloc] initWithFormat:@"%d", 0];
        _timeSpecific = @"false";
        _points =  25;
        _completed = false;
        _reminderMessage = @"NA";
    }
	return self;
}

- (id)initWithMessageAndPoints:(NSString *)msg
                        points: (NSInteger) pts
{
    self = [super init];
    
 	if (self)
    {
        _message = [[NSString alloc] initWithString: msg];
        _time = [[NSString alloc] initWithFormat:@"%d", 0];
        _timeSpecific = @"false";
        _points =  pts;
        _completed = false;
    }
    
	return self;
}

//- (id)initWithMessage: (NSString *)msg
//                 time: (NSString *)t 
//         timeSpecific: (NSString *)ts 
//             points: (NSInteger *)iPoints
//               ageMin: (NSString *)min
//               ageMax: (NSString *)max
//           femaleExcl: (NSString *)female
//             maleExcl: (NSString *)male
//       schoolSpecific: (NSString *)ss
//                scool: (NSString *)school
//         workSpecific: (NSString *)ws
//                 completed: (bool) bCompleted
//{
//    self = [super init];
//    
// 	if (self)
//    {
//        _message = [[NSString alloc] initWithString: msg];
//        _time = [[NSString alloc] initWithString: t];
//        _timeSpecific = [[NSString alloc] initWithString: ts];
//        _points = *iPoints;
//        _completed = &bCompleted;
//    }   
//    
//	return self;
//}

- (id)copyWithZone:(NSZone *)zone
{
	Task *task = [[Task alloc] init];
    
    task.message = [NSString stringWithString:_message];
    task.time = [NSString stringWithString:_time];
    task.timeSpecific = [NSString stringWithString:_timeSpecific];
    task.points = _points;
    task.completed = _completed;
    task.reminderMessage =[NSString stringWithString:_reminderMessage];
    return task;
}


@end

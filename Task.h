//
//  Task.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 1/23/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject <NSCoding, NSCopying>
//{
//    NSString *message;      // text
//    NSString *timeSpecific; // bool
//    NSString *time;         // int
//    NSInteger points;     // int
//    bool *completed;     // int
//}

@property (nonatomic, retain) NSString *message;
@property (nonatomic, retain) NSString *timeSpecific;
@property (nonatomic, retain) NSString *time;
@property (nonatomic, assign) NSInteger points;
@property (nonatomic, retain) NSString *reminderMessage;
@property bool completed;

- (void)encodeWithCoder: (NSCoder *)encoder;
- (id)initWithCoder: (NSCoder *)decoder;

- (id)initWithMessageAndPoints:(NSString *)msg
                        points: (NSInteger) pts;

- (id)initWithMessage: (NSString *)msg
                 time: (NSString *)t
         timeSpecific: (NSString *)ts
               points: (NSInteger)iPoints
               ageMin: (NSString *)min
               ageMax: (NSString *)max
           femaleExcl: (NSString *)female
             maleExcl: (NSString *)male
       schoolSpecific: (NSString *)ss
                scool: (NSString *)school
         workSpecific: (NSString *)ws
            completed: (bool) bCompleted;

@end

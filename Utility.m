//
//  Utility.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (NSString *)profilePath {
    NSString *docDir = 
	[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
										 NSUserDomainMask, YES) objectAtIndex: 0];
	return [docDir stringByAppendingPathComponent: @"Profile.dat"];
}

+ (void)archiveProfile:(HappyProfile *)profile
{    
    NSString *filePath = [self profilePath];
    
    NSError *error = nil;
    NSDictionary *attrib;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //
    // check if file already exist
    //
    BOOL exist = [fileManager fileExistsAtPath:filePath];
    BOOL success = YES;
    if (YES == exist) 
    {
        // UNLOCK THE FILE
        attrib = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                             forKey:NSFileImmutable];
        
        success = [fileManager setAttributes:attrib 
                                ofItemAtPath:filePath 
                                       error:&error];
    }
    if (YES == success) 
    {
        // SAVE THE FILE
        [NSKeyedArchiver archiveRootObject:profile 
                                    toFile:filePath];
        
        // LOCK IT BACK
        attrib = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES]
                                             forKey:NSFileImmutable];
        
        success = [fileManager setAttributes:attrib 
                                ofItemAtPath:filePath 
                                       error:&error];
        
        if (NO == success) {
            NSLog(@"Error: %@",[error localizedDescription]);
        }
    }
    else {
        NSLog(@"Could not UNLOCK the file.");
    }
}

+ (HappyProfile *)unarchiveProfile
{
    NSString *filePath = [self profilePath];
    
 	HappyProfile *profile = [NSKeyedUnarchiver unarchiveObjectWithFile: filePath];
    
    if (nil == profile) {
        profile = [[HappyProfile alloc] init];
    }
    
    return profile;
}

@end

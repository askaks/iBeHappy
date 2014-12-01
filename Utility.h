//
//  Utility.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 12/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HappyProfile.h"

@interface Utility : NSObject

+ (NSString *)profilePath;
+ (void)archiveProfile:(HappyProfile *)profile;
+ (HappyProfile *)unarchiveProfile;

@end

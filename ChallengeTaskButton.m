//
//  ChallengeTaskButton.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 7/1/13.
//
//

#import "ChallengeTaskButton.h"

@implementation ChallengeTaskButton
@synthesize taskNumber;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    taskNumber = 0;
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

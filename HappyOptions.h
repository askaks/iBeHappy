//
//  HappyOptions.h
//  iBeHappy
//
//  Created by Joanna Szymczyk on 3/8/14.
//
//

#import <Foundation/Foundation.h>

@interface HappyOptions : NSObject <NSCoding, NSCopying>
//{
//}

@property (nonatomic, retain) NSMutableArray *loveOptions;
@property (nonatomic, retain) NSMutableArray *educationOptions;
@property (nonatomic, retain) NSMutableArray *incomeOptions;
@property (nonatomic, retain) NSMutableArray *childOptions;
@property (nonatomic, retain) NSMutableArray *petOptions;

- (void)encodeWithCoder: (NSCoder *)encoder;
- (id)initWithCoder: (NSCoder *)decoder;

@end

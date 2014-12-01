//
//  HappyOptions.m
//  iBeHappy
//
//  Created by Joanna Szymczyk on 3/8/14.
//
//

#import "HappyOptions.h"

@implementation HappyOptions


- (void)encodeWithCoder: (NSCoder *)encoder
{
    [encoder encodeObject: _loveOptions forKey: @"loveOptions"];
    [encoder encodeObject: _educationOptions forKey: @"educationOptions"];
    [encoder encodeObject: _incomeOptions forKey: @"incomeOptions"];
    [encoder encodeObject: _childOptions forKey: @"childOptions"];
    [encoder encodeObject: _petOptions forKey: @"petOptions"];
}

- (id)init
{
    self = [super init];
    
 	if (self)
	{
        _loveOptions = [[NSMutableArray alloc] init];
        _educationOptions = [[NSMutableArray alloc] init];
        
        _incomeOptions = [[NSMutableArray alloc] init];
        _childOptions = [[NSMutableArray alloc] init];
        
        _petOptions = [[NSMutableArray alloc] init];
    }
    
	return self;
}

- (id)initWithCoder: (NSCoder *)decoder
{
    self = [super init];
    
 	if (self)
    {
        self.loveOptions = [decoder decodeObjectForKey:@"loveOptions"];
        
        self.educationOptions = [decoder decodeObjectForKey:@"educationOptions"];
        
        self.incomeOptions = [decoder decodeObjectForKey:@"incomeOptions"];
        
        self.childOptions = [decoder decodeObjectForKey:@"childOptions"];
        
        self.petOptions = [decoder decodeObjectForKey: @"petOptions"];
    }
	return self;
}


- (id)copyWithZone:(NSZone *)zone
{
	HappyOptions *options = [[HappyOptions alloc] init];
    
    options.loveOptions = [self.loveOptions copy];
    options.educationOptions = [self.educationOptions copy];
    options.incomeOptions = [self.incomeOptions copy];
    options.childOptions = [self.childOptions copy];
    options.petOptions = [self.petOptions copy];
    
    return options;
}
@end

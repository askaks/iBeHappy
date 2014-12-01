//
//  ChangeDateViewController.h
//  FuelEcoFree
//
//  Created by Jaroslaw Szymczyk on 6/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HappyProfile.h"

@interface ChangeDateViewController : UIViewController //<ADBannerViewDelegate>
{	
	UIButton *dateBtn;
	IBOutlet UIDatePicker *datePicker;

//    NSMutableArray *fuelingArray;
//	NSUInteger currentIndex;
	
//    UIView *contentView;
//    ADBannerView *banner;
//    bool bannerIsVisible;
}
@property (nonatomic, retain) NSDateFormatter *dateFormat;

@property (nonatomic, retain) UIButton *dateBtn;
@property (nonatomic, retain) UIDatePicker *datePicker;
@property (nonatomic, retain) HappyProfile *profile;

//@property (nonatomic, assign) NSMutableArray *fuelingArray;

//@property (nonatomic, retain) IBOutlet UIView *contentView;
//@property (nonatomic, retain) IBOutlet ADBannerView *banner;
//@property bool bannerIsVisible;


- (IBAction)goBack;
- (IBAction)showDate:(id)sender;
- (void)setDate:(UIButton *)button
        profile:(HappyProfile *)prof;


@end

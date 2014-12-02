//
//  ChangeDateViewController.m
//  FuelEcoFree
//
//  Created by Jaroslaw Szymczyk on 6/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ChangeDateViewController.h"
#import <Parse/Parse.h>


@implementation ChangeDateViewController

@synthesize dateBtn;
@synthesize datePicker;
@synthesize profile;

- (IBAction)goBack {
    NSString *str = [dateBtn titleForState:0];
    NSDate *day = [_dateFormat dateFromString:str];
    profile.birthDay = day;
    [self dismissViewControllerAnimated:YES completion:nil];
	//[self dismissModalViewControllerAnimated:YES];
    //[self presentViewController:challengeVC animated:YES completion:nil];
}

- (IBAction)showDate:(id)sender {
	
	NSDate *date = [sender date];
	
	NSString *str = [_dateFormat stringFromDate:date];
	[dateBtn setTitle:str forState:0];

    // birthDay is a NSDate not a string
    profile.birthDay = date; 
    
    //
    // Write to Parse and save. NOTE: saving is not done immediately!!!
    // There is another function <save> that would do it right away but
    // you get warning that you are doing something slow on the main
    // thread!!! COOL.
    //
    [PFUser currentUser][@"DOB"] = date;
    [[PFUser currentUser] saveInBackground];
}

//- (void)setDate:(id)sender {
- (void)setDate:(UIButton *)button profile:(HappyProfile *)prof
{
	self.dateBtn = button;
    
    self.profile = prof;
    
    NSString *stringOfDateOnButton = [dateBtn titleForState:0];
    if (stringOfDateOnButton == nil)
    {
        NSDate *now = [[NSDate alloc] init];
        stringOfDateOnButton = [_dateFormat stringFromDate:now];
    }

	NSDate *dateOnButton = [_dateFormat dateFromString:stringOfDateOnButton];
	
	[datePicker setDate: dateOnButton];
	
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
#pragma mark -
#pragma mark -loading/unloading view

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set standard format of date
    _dateFormat = [[NSDateFormatter alloc] init];
    [_dateFormat setDateFormat:@"MMMM d, yyyy"];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.dateBtn = nil;
	self.datePicker = nil;
}
@end




/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/



//#pragma mark -
//#pragma mark ADBannerViewDelegate methods
//
//-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
//{
//    //hide banner
//    [self moveBannerOffScreen];
//}
//
//-(void)bannerViewDidLoadAd:(ADBannerView *)banner
//{
//    //show when we have content
//    [self moveBannerBackOn];
//}
//
//-(void)moveBannerOffScreen
//{
//    if (bannerIsVisible)
//    {
//        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
//
//        banner.frame = CGRectOffset(banner.frame, 0, banner.frame.size.height);
//
//        [UIView commitAnimations];
//
//        self.bannerIsVisible = NO;
//    }
//}
//
//-(void)moveBannerBackOn
//{
//    if (!bannerIsVisible)
//    {
//        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
//
//        banner.frame = CGRectOffset(banner.frame, 0, -banner.frame.size.height);
//
//        [UIView commitAnimations];
//
//        self.bannerIsVisible = YES;
//    }
//}



//- (void)dealloc {
//
//	[dateBtn release];
//	[datePicker release];
//    [fuelingArray release];
//
//    [super dealloc];
//}




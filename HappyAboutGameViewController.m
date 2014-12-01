//
//  HappyAboutGameViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 5/17/13.
//
//

#import "HappyAboutGameViewController.h"

@interface HappyAboutGameViewController ()

@end

@implementation HappyAboutGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.navigationController == nil)
    {
        self.backToHelpRegularButton.hidden = false;
        self.backToHelpStoryboardButton.hidden = true;
    }
    else
    {
        self.backToHelpRegularButton.hidden = true;
        self.backToHelpStoryboardButton.hidden = false;
    }
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setBackToHelpStoryboardButton:nil];
    [self setBackToHelpRegularButton:nil];
    [super viewDidUnload];
     [self dismissModalViewControllerAnimated:NO];
}
- (IBAction)BackToHelpRegular:(id)sender {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
//    UIViewController *aboutVC = [storyboard instantiateViewControllerWithIdentifier:@"805"];
    //[self dismissModalViewControllerAnimated:NO];
//    aboutVC = nil;
}
@end

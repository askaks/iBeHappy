//
//  HappySignupViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 3/6/14.
//
//

#import <UIKit/UIKit.h>
#import "HappyProfile.h"


@interface HappySignupViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *emailText;
@property (strong, nonatomic) IBOutlet UITextField *passText;
@property (weak, nonatomic) IBOutlet UIImageView *nonFBView;
@property (weak, nonatomic) IBOutlet UILabel *nonFBNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *nonFBNameTextfield;
@property (weak, nonatomic) IBOutlet UILabel *nonFBPasswordLabel;
@property (weak, nonatomic) IBOutlet UITextField *nonFBPasswordTextfield;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *createButton;
@property (weak, nonatomic) IBOutlet UITextView *signupWelcomeMessageText;
@property (nonatomic, retain) HappyProfile *profile;

- (IBAction)createNativeIBeHappyProfileButtonClick:(id)sender;
- (IBAction)backAction:(id)sender;
- (IBAction)twitterLoginButtonClick:(id)sender;

@end

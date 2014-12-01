//
//  HappyAboutGameViewController.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 5/17/13.
//
//

#import <UIKit/UIKit.h>

@interface HappyAboutGameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *backToHelpStoryboardButton;
@property (weak, nonatomic) IBOutlet UIButton *backToHelpRegularButton;

- (IBAction)BackToHelpRegular:(id)sender;
@end

//
//  HappyCustomSegue.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 1/26/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "HappyCustomSegue.h"
#import "QuartzCore/QuartzCore.h"

@implementation HappyCustomSegue

-(void)perform {
    
    UIViewController *sourceViewController = (UIViewController*)[self sourceViewController];
    //UIViewController *destinationController = (UIViewController*)[self destinationViewController];
    
    CATransition* transition = [CATransition animation];
    //transition.duration = .25;
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    transition.type = kCATransitionPush;
//    transition.type = kCATransitionMoveIn;
    //    transition.type = kCATransitionPush;
    //transition.type = kCATransitionReveal;
    //    transition.type = kCATransitionFade;
    
    
    
    //    transition.subtype = kCATransitionFromLeft; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    transition.subtype = kCATransitionFromLeft; 
//    transition.subtype = kCATransitionFromRight;     
    
    
    [sourceViewController.navigationController.view.layer addAnimation:transition
                                                                forKey:kCATransition];
//    
//    [sourceViewController.navigationController pushViewController:destinationController animated:YES];    
//    
}
@end

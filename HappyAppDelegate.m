//
//  HappyAppDelegate.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappyAppDelegate.h"

#import <Parse/Parse.h>

#import <FacebookSDK/FacebookSDK.h>

#import "HappySignupViewController.h"

#import "HappyHomeViewController.h"



@implementation HappyAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //[_window addSubview:self.
    //[_window makeKeyAndVisible];
    
    
    /*****                                        *****/
    /***** from Parse Dashboard: Application keys *****/
    /*****                                        *****/
    [Parse setApplicationId:@"pvJll9oJhI8ggEF4lTN7J07bBj7VB7rw4fBp8vyh"
                  clientKey:@"4kOhk0rB3Vd53uZH55vnZsS8a9DMgF4ZYidaCtvG"];
    
    
    //****************************************************************
    // Fill in with your Parse and Twitter credentials. Don't forget
    // to add your Facebook id in Info.plist:
    //****************************************************************
    [PFTwitterUtils initializeWithConsumerKey:@"yDHgblzLpcoFlgkX245oAwu45" consumerSecret:@"Kw6Ly9LvOFX0NFPWKc6Jd5g2IMx9ptrksJlOnThgLsJsMANRZa"];

    
    //****************************************************************
    // Your Facebook application id is configured in Info.plist.
    // ***************************************************************
    [PFFacebookUtils initializeFacebook];
    
    //****************************************************************
    // Used to control which users can access or modify a particular
    // object:
    //****************************************************************
    PFACL *defaultACL = [PFACL ACL];
    [defaultACL setPublicReadAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    
    //
    // Get cached currentUser, if it was created already
    //
    PFUser *currentUser = [PFUser currentUser];
    
    //this would delete the current user and let you switch users
    // [PFUser logOut];
    
    if (currentUser)
    {
        NSLog(@"User exists so continue as usual");
        
        application.applicationIconBadgeNumber = 0;
        
        // Handle launching from a notification
        UILocalNotification *localNotif =
        [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
        if (localNotif) {
            NSLog(@"Recieved Notification %@",localNotif);
        }
    }
    else
    {
        NSLog(@"User does not exist");
        _viewController = [[HappyHomeViewController alloc] initWithNibName:@"HappyHomeViewController" bundle:nil];
        
        self.window.rootViewController = _viewController;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Disclaimer"
                                                        message:@"iBeHappy is meant to be used resonsibly etc etc.  By hitting Accepting these terms you agree that you yourself are, or have the permission of a legal adult in your country able to make responsible decisions."
                                                       delegate:self
                                              cancelButtonTitle:@"Accept"
                                              otherButtonTitles: @"Reject",nil];
        [alert show];
        
        //Move the part belowe somehwere else
//        _viewController = [[HappySignupViewController alloc]  initWithNibName:@"HappySignupViewController" bundle:nil];
//        
//        self.window.rootViewController = _viewController;
    }
    // Handle launching from a notification
    UILocalNotification *localNotif =
    [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotif) {
        NSLog(@"Recieved Notification %@",localNotif);
    }
    [self registerForRemoteNotification];
    return YES;
}

- (void)registerForRemoteNotification {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
#else
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    
#endif
}

#ifdef __IPHONE_8_0
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [application registerForRemoteNotifications];
}
#endif
- (void)application:(UIApplication *)app didReceiveLocalNotification:(UILocalNotification *)notif {
    // Handle the notificaton when the app is running
    NSLog(@"Recieved Notification %@",notif);
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    [[PFFacebookUtils session] close];
}


//- (void)application:(UIApplication *)app didReceiveLocalNotification:(UILocalNotification *)notif {
//    // Handle the notificaton when the app is running
//    NSLog(@"Recieved Notification %@",notif);
//}
// ****************************************************************************
// App switching methods to support Facebook Single Sign-On.
// ****************************************************************************
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

-(void)alertView:(UIAlertView*)alert didDismissWithButtonIndex:(NSInteger)buttonIndex;
{
    NSString *title = [alert buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"Accept"]) {
//        _viewController = [[HappyHomeViewController alloc] initWithNibName:@"HappyHomeViewController" bundle:nil];
//        
//        self.window.rootViewController = _viewController;

    }
        if ([title isEqualToString:@"Reject"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Disclaimer"
                                                            message:@"iBeHappy is meant to be used resonsibly etc etc.  By hitting Accepting these terms you agree that you yourself are, or have the permission of a legal adult in your country able to make responsible decisions."
                                                           delegate:self
                                                  cancelButtonTitle:@"Show Disclaimer"
                                                  otherButtonTitles: nil,nil];
            [alert show];
        
    }
    if ([title isEqualToString:@"Show Disclaimer"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Disclaimer"
                                                        message:@"iBeHappy is meant to be used resonsibly etc etc.  By hitting Accepting these terms you agree that you yourself are, or have the permission of a legal adult in your country able to make responsible decisions."
                                                       delegate:self
                                              cancelButtonTitle:@"Accept"
                                              otherButtonTitles: @"Reject",nil];
        [alert show];
        
    }
}
@end

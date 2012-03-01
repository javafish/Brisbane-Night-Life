//
//  BNLAppDelegate.m
//  BNL
//
//  Created by Jia Zhu on 5/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BNLAppDelegate.h"
#import "FirstViewController.h"
#import "Results.h"

@implementation BNLAppDelegate

@synthesize window = _window;


- (void)applicationDidFinishLaunching:(UIApplication *)application{
    
    navController = [[UINavigationController alloc] init];
    
    navController.navigationBar.barStyle = UIBarStyleBlack;

    //the first view screen
    FirstViewController *firstViewController = [[FirstViewController alloc] init];
    
    firstViewController.title = @"Brisbane Night Life";

    [navController pushViewController:firstViewController animated:NO];
    [firstViewController release];
    
    [_window addSubview:navController.view];
    [_window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [navController release];

    [super dealloc];
}



@end

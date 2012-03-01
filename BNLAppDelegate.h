//
//  BNLAppDelegate.h
//  BNL
//
//  Created by Jia Zhu on 5/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNLAppDelegate : NSObject <UIApplicationDelegate>{
    UIWindow *window;
    UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;




@end

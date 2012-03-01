//
//  SecondViewController.h
//  BNL
//
//  Created by Jia Zhu on 10/09/11.
//  Top view of the results screen.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"
#import "Results.h"

@interface SecondViewController : UIViewController <UITabBarDelegate>{
    UITabBar *myTabBar;
    UIViewController *currentViewController;
    NSString *responseString;   
    MapViewController *mapViewController;
    Results *resultsViewController;
}

@property (nonatomic, retain) IBOutlet UITabBar *myTabBar;

@property (nonatomic, retain) UIViewController *currentViewController;
@property (nonatomic, retain) MapViewController *mapViewController;
@property (nonatomic, retain) Results *resultsViewController;
@property (retain, nonatomic) NSString* responseString;
@end


//
//  DetailViewController.h
//  BNL
//
//  Created by Jia Zhu on 20/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoutViewController.h"
#import "Details.h"
#import "CommentsViewController.h"

@interface DetailViewController : UIViewController <UITabBarDelegate>{
    
    UINavigationController *navController;
    UITabBar *myTabBar1;
    ShoutViewController *myAboutVC;
    UIViewController *currentViewController1; 
    NSMutableData* responseData;
    NSString *responseString;
    NSString *responseComments;
    NSString *PUBID; 
    Details *details;
    CommentsViewController *comments;
    NSURLConnection *_connection;
}

@property (nonatomic, retain) Details *details;
@property (nonatomic, retain) CommentsViewController *comments;
@property (nonatomic, retain) IBOutlet UITabBar *myTabBar1;
@property (nonatomic, retain) ShoutViewController *myAboutVC;
@property (nonatomic, retain) UIViewController *currentViewController1;
@property (nonatomic, retain) UIViewController *navController;
@property (retain, nonatomic) NSString* responseString;
@property (retain, nonatomic) NSMutableData* responseData;
@property (retain, nonatomic) NSString *PUBID; 

@end

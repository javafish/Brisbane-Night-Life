//
//  Results.h
//  BNL
//
//  Created by Jia Zhu on 10/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface Results : UIViewController{
     NSString *responseString;
     IBOutlet UITableView *resultstableView;
     NSMutableArray *resultsArray;
     NSMutableArray *addressArray;
     NSMutableArray *pubIDArray;
     UINavigationController *navController;
     NSMutableData* responseData;
     int total;
    NSURLConnection *_connection;
    DetailViewController *detailViewController;
}
@property (nonatomic, retain) NSString *responseString;
@property (nonatomic, retain) IBOutlet UITableView *resultstableView;
@property (nonatomic, retain) NSMutableArray	*resultsArray;
@property (nonatomic, retain) NSMutableArray	*addressArray;
@property (nonatomic, retain) NSMutableArray	*pubIDArray;
@property int total;
@property (nonatomic, retain) UINavigationController *navController;
@property (retain, nonatomic) NSMutableData* responseData;
@property (retain, nonatomic)  DetailViewController *detailViewController;


@end

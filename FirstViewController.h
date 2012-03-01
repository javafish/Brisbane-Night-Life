//
//  FirstViewController.h
//  BNL
//
//  Created by Jia Zhu on 9/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController{
    NSString *responseString;
    NSMutableData* responseData;
    NSURLConnection *_connection;
    IBOutlet UIButton *goOut;
    IBOutlet UIButton *about;
    IBOutlet UILabel *waiting;
}

@property (retain, nonatomic) NSString* responseString;
@property (retain, nonatomic) NSMutableData* responseData;
- (IBAction)pushViewController:(id)sender;
- (IBAction)pushAboutUsViewController:(id)sender;
@end

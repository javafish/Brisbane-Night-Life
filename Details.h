//
//  Details.h
//  BNL
//
//  Created by Jia Zhu on 22/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface DetailsAddressAnnotation : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    
    NSString *title;
    NSString *subtitle;
    
}
-(NSString *)title;
-(NSString *)subtitle;
-(void) setTitle:(NSString *)titleValue;
-(void) setSubTitle:(NSString *)subtitleValue;

@end

@interface Details : UIViewController{
    
    NSString *PUBID; 
    
    IBOutlet UILabel *PUBINFO;
    
    IBOutlet UILabel *PUBADDRESS;
    
    IBOutlet UILabel *HOMEPAGE;
    
    MKMapView *mapView;    
    NSMutableData* responseData;
    DetailsAddressAnnotation *addAnnotation; 
    UITextView *textView;
    UIScrollView *scrollView;
    NSMutableArray *address;

}

@property (retain, nonatomic)  NSString *PUBID; 
@property (retain, nonatomic)  IBOutlet UILabel *PUBINFO;
@property (retain, nonatomic)  IBOutlet UILabel *PUBADDRESS;
@property (retain, nonatomic)  IBOutlet UILabel *HOMEPAGE;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UITextView *textView;
@end

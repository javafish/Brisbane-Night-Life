//
//  MapViewController.h
//  BNL
//
//  Created by Jia Zhu on 11/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface AddressAnnotation : NSObject <MKAnnotation>
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




@interface MapViewController : UIViewController{
    
    MKMapView *mapView;    
    NSMutableData* responseData;
    AddressAnnotation *addAnnotation; 
    NSString *responseString;
    NSMutableArray *address;

}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (retain, nonatomic) NSMutableData* responseData;
@property (retain, nonatomic) NSString *responseString;
@property (retain, nonatomic) NSMutableArray *address;

@end
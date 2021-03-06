//
//  SecondViewController.m
//  BNL
//
//  Created by Jia Zhu on 10/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"



@implementation SecondViewController

@synthesize myTabBar;
@synthesize currentViewController;
@synthesize mapViewController;
@synthesize resultsViewController;
@synthesize responseString;

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
   
    if(item.tag == 0){
       
        resultsViewController = [[Results alloc] initWithNibName:@"Results" bundle:nil];;
        resultsViewController.responseString = self.responseString;
        resultsViewController.navController =  self.navigationController;
        [self.view insertSubview:resultsViewController.view belowSubview:myTabBar];
        
        if(currentViewController !=nil){
            [currentViewController.view removeFromSuperview];
            currentViewController = resultsViewController;
        }
    }
    
    if(item.tag == 1){
   
       mapViewController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];;
       mapViewController.responseString = self.responseString;
            
        [self.view insertSubview:mapViewController.view belowSubview:myTabBar];
       
        if(currentViewController !=nil){
            [currentViewController.view removeFromSuperview];
            currentViewController = mapViewController;
        }
         
    }
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
 
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
    
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    resultsViewController = [[Results alloc] initWithNibName:@"Results" bundle:nil];;
    resultsViewController.responseString = self.responseString;
 
    resultsViewController.navController =  self.navigationController;
    [self.view insertSubview:resultsViewController.view belowSubview:myTabBar];

}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc
{
    
    
    [super dealloc];
   [mapViewController release];
   // [resultsViewController release];
    
}

@end

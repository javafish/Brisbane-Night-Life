//
//  DetailViewController.m
//  BNL
//
//  Created by Jia Zhu on 20/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "Details.h"
#import "JSON.h"

@implementation DetailViewController
@synthesize myTabBar1;
@synthesize currentViewController1;
@synthesize PUBID;
@synthesize navController;
@synthesize responseString;
@synthesize responseData;
@synthesize myAboutVC;
@synthesize details;
@synthesize comments;

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if(item.tag == 0){
        
        details = [[Details alloc] initWithNibName:@"Details" bundle:nil];;
        details.PUBID = self.PUBID;
                [self.view insertSubview:details.view belowSubview:myTabBar1];
        
        if(currentViewController1 !=nil){
            [currentViewController1.view removeFromSuperview];
            currentViewController1 = details;
        }
    }
    
    if(item.tag == 1){
    
        self.responseData = [NSMutableData data];
        NSArray* detailsData = [self.PUBID JSONValue];
        NSDictionary* singleResult = [detailsData objectAtIndex:0];
        
        
        NSString* pubid = [singleResult objectForKey:@"ID"];
        
        NSString *url = [@"http://www.i-triple.com/bnl/getshoutoutmessages.php?pubid=" stringByAppendingString:pubid];

        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        
        _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    }
   
    
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[_connection release];
	self.responseData = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [_connection release];
   
    responseComments = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    self.responseData = nil;
 
    comments = [[CommentsViewController alloc] initWithNibName:@"CommentsViewController" bundle:nil];;
    comments.responseString = responseComments;
    comments.navController = navController;
    [self.view insertSubview:comments.view belowSubview:myTabBar1];
  
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
   
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
    
    UIImage *image = [UIImage imageNamed:@"Shout.png"];
    UIBarButtonItem *button2 = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(myAboutButtonClicked)];
  
        
    self.navigationItem.rightBarButtonItem = button2;
    
    [button2 release];
    details = [[Details alloc] initWithNibName:@"Details" bundle:nil];
    details.PUBID = self.PUBID;
    [self.view insertSubview:details.view belowSubview:myTabBar1];
   
}


-(void)myAboutButtonClicked {
     NSArray* detailsData = [self.PUBID JSONValue];
     NSDictionary* singleResult = [detailsData objectAtIndex:0];
    
    NSString* pubid = [singleResult objectForKey:@"ID"];
    myAboutVC = [[ShoutViewController alloc] initWithNibName:@"ShoutViewController" bundle:nil];
    myAboutVC.navController = navController;
    //Exception thrown at line below
    myAboutVC.pubid = pubid;
    [navController pushViewController:myAboutVC animated:YES];
    
   // [myAboutVC release];
    
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];

}

- (void)dealloc{
    
    [super dealloc];
    [details release];
    [comments release];
    [_connection release];
}       

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

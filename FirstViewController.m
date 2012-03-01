//
//  FirstViewController.m
//  BNL
//
//  Created by Jia Zhu on 9/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "AboutUsViewController.h"

@implementation FirstViewController
@synthesize responseString;
@synthesize responseData;

- (IBAction)pushViewController:(id)sender{
   
    self.responseData = [NSMutableData data];
    //retrieve all data
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://i-triple.com/bnl/getdata.php?target=ALL"]];
    goOut.hidden = YES;
    about.hidden = YES;
    waiting.hidden = NO;
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

}

- (IBAction)pushAboutUsViewController:(id)sender{

    
    //Results screen after the first search
    AboutUsViewController *aboutusViewController = [[AboutUsViewController alloc] init];
    aboutusViewController.title = @"About Us";

    
    [self.navigationController pushViewController:aboutusViewController animated:YES];
    
    [aboutusViewController release];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
   
    self.responseData = nil;
    
    //Results screen after the first search
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    secondViewController.title = @"Results";
    secondViewController.responseString = self.responseString;
    waiting.hidden = YES;
    about.hidden = NO;
    goOut.hidden = NO;
    [self.navigationController pushViewController:secondViewController animated:YES];
    
    [secondViewController release];
    
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
    // Do any additional setup after loading the view from its nib.
    waiting.hidden = YES;
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
    [_connection release];
    [responseString release];
        
}

@end

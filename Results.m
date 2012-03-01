//
//  Results.m
//  BNL
//
//  Created by Jia Zhu on 10/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Results.h"
#import "JSON.h"
#import "CustomTableCell.h"

@implementation Results
@synthesize responseString;
@synthesize resultstableView;
@synthesize resultsArray;
@synthesize addressArray;
@synthesize pubIDArray;
@synthesize total;
@synthesize navController;
@synthesize responseData;
@synthesize detailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
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

    // Do any additional setup after loading the view from its nib.
  
    [super viewDidLoad];
     NSArray* resultsData = [responseString JSONValue];
    
	[responseString release];
    
    total = [resultsData count];
  
    resultsArray = [[NSMutableArray alloc] init]; 
    addressArray = [[NSMutableArray alloc] init]; 
    pubIDArray = [[NSMutableArray alloc] init]; 
	for (int i = 0; i < total; i++){

        NSDictionary* singleResult = [resultsData objectAtIndex:i];
        
        
        NSString* name = [singleResult objectForKey:@"NAME"];
        NSString* addressDetail = [singleResult objectForKey:@"ADDRESS"];
        NSString* PUBID = [singleResult objectForKey:@"ID"];       
       
        [resultsArray addObject:name];
        [addressArray addObject:addressDetail];
        [pubIDArray addObject:PUBID];

    }
    
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return total;
}


- (CustomTableCell *)tableView:(CustomTableCell *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *CellIdentifier = @"CustomTableCell";
    
    CustomTableCell *cell = (CustomTableCell *)[resultstableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
    
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:nil options:nil];
        
        for (id currentObject in topLevelObjects){
            if([currentObject isKindOfClass:[UITableViewCell class]]){
                cell = (CustomTableCell *) currentObject;
                break;
            }
        }

    }
    
    // Configure the cell.
	cell.name.text = [resultsArray objectAtIndex:indexPath.row];
    cell.address.text = [addressArray objectAtIndex:indexPath.row];
    
	cell.PUBID.text = [pubIDArray objectAtIndex:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTableCell *cell = (CustomTableCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    self.responseData = [NSMutableData data];
    
    NSString *url = [@"http://i-triple.com/bnl/getdata.php?id=" stringByAppendingString:cell.PUBID.text];
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
   _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
  
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

    
    detailViewController = [[DetailViewController alloc] init];

    detailViewController.PUBID = self.responseString;
    detailViewController.navController = navController;

    [navController pushViewController:detailViewController animated:YES];
    
   // [detailViewController release];
    
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
   // [detailViewController release];
    [resultsArray release];
    [addressArray release];
    [pubIDArray release];
    [_connection release];
}

@end

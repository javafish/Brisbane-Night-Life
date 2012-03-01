//
//  CustomTableCell.m
//  BNL
//
//  Created by Jia Zhu on 18/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomTableCell.h"

@implementation CustomTableCell
@synthesize name;
@synthesize address;
@synthesize PUBID;




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

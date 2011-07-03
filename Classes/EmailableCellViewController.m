//
//  EmailableCellViewController.m
//  EmailableCell
//
//  Created by Ahmet Ardal on 7/3/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import "EmailableCellViewController.h"

@implementation EmailableCellViewController

@synthesize demoTableView, emailAddresses;

- (void) viewDidLoad
{
    [super viewDidLoad];

    self.emailAddresses = [NSArray arrayWithObjects:
                           @"macbeth@example.com", @"ladymacbeth@example.com", @"duncan@example.com", 
                           @"banquo@example.com", @"lennox@example.com", @"macduff@example.com", nil];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) viewDidUnload
{
}

- (void) dealloc
{
    [self.demoTableView release];
    [self.emailAddresses release];
    [super dealloc];
}


#pragma mark -
#pragma mark Table Data Source / Delegate Methods

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.emailAddresses.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *cellId = @"EmailableCell";
    EmailableCell *cell = (EmailableCell *) [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[EmailableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
    }
    [cell setIndexPath:indexPath];
    [cell setDelegate:self];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.text = [self.emailAddresses objectAtIndex:indexPath.row];

    return cell;
}


#pragma mark -
#pragma mark EmailableCellDelegate Methods

- (void) emailableCell:(EmailableCell *)cell selectCellAtIndexPath:(NSIndexPath *)indexPath
{
    [self.demoTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
}

- (void) emailableCell:(EmailableCell *)cell deselectCellAtIndexPath:(NSIndexPath *)indexPath
{
    [self.demoTableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (NSString *) emailableCell:(EmailableCell *)cell emailAddressForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.emailAddresses objectAtIndex:indexPath.row];
}

- (void) emailableCell:(EmailableCell *)cell didPressSendEmailOnCellAtIndexPath:(NSIndexPath *)indexPath
{
    MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
    if (controller == nil) {
        return;
    }
    controller.mailComposeDelegate = self;
    NSString *emailAddress = [self.emailAddresses objectAtIndex:indexPath.row];
    [controller setToRecipients:[NSArray arrayWithObject:emailAddress]];
    [self presentModalViewController:controller animated:YES];
    [controller release];
}


#pragma mark -
#pragma mark MFMailComposeViewControllerDelegate

- (void) mailComposeController:(MFMailComposeViewController *)controller
           didFinishWithResult:(MFMailComposeResult)result
                         error:(NSError *)error
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"Mail sent successfully.");
    }
    else if (result == MFMailComposeResultFailed) {
        NSLog(@"Mail could not be sent: %@", [error description]);
    }
    [self dismissModalViewControllerAnimated:YES];
}

@end

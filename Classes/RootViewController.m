//
//  RootViewController.m
//  LogMyNight
//
//  Created by junterguggenberger on 11.04.10.
//  Copyright ToolsOnAir 2010. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

@synthesize provider;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
 
 	provider = [[DrinkProvider alloc] init];
	//[provider release];
}

-(IBAction)analyse:(id)sender{

	AnalyseViewController *analyseView = [[AnalyseViewController alloc] initWithNibName:@"AnalyseViewController" bundle:[NSBundle mainBundle]];
	self.navigationItem.title = @"Back";
	[self.navigationController pushViewController:analyseView animated:YES];
	[analyseView release];

}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
		return (NSInteger)[provider size];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	NSLog(@"Drink: %@ index %d" , [provider drinkAtIndex:[indexPath row]], [indexPath row]);
	Drink *drink = [provider drinkAtIndex:[indexPath row]];
	[[cell textLabel] setText:[drink name]]; 
	NSLog(@"Drink added to table");

    return cell;
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	//return UITableViewCellAccessoryDetailDisclosureButton;
	return UITableViewCellAccessoryDisclosureIndicator;
}

// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	// Navigation logic may go here -- for example, create and push another view controller.
	
	DetailViewController *detailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
	

	
	
	self.navigationItem.title = @"Back";

	[self.navigationController pushViewController:detailView animated:YES];
	
	[detailView.lbl_name setText:[[provider drinkAtIndex:[indexPath row]] name]];

//	DetailViewController *detailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];

	//[self.navigationController pushViewController:detailView animated:YES];

	[detailView release];



}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
	[provider release];
	[DBConnectionManager finalize];
    [super dealloc];
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//	if (section == 0 || section == 1) {
//		CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
//		UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, 44.0)];
//		footerView.autoresizesSubviews = YES;
//		footerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//		footerView.userInteractionEnabled = YES;
//		
//		footerView.hidden = NO;
//		footerView.multipleTouchEnabled = NO;
//		footerView.opaque = NO;
//		footerView.contentMode = UIViewContentModeScaleToFill;
//		
//		// Add the label
//		UILabel*    footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(150.0, -5.0, 120.0, 45.0)];
//		footerLabel.backgroundColor = [UIColor clearColor];
//		footerLabel.opaque = NO;
//		footerLabel.text = @"Sharing";
//		footerLabel.textColor = [UIColor redColor];
//		footerLabel.highlightedTextColor = [UIColor greenColor];
//		footerLabel.font = [UIFont boldSystemFontOfSize:17];
//		footerLabel.shadowColor = [UIColor whiteColor];
//		footerLabel.shadowOffset = CGSizeMake(0.0, 1.0);
//		[footerView addSubview: footerLabel];
//		
//		[footerLabel release];  
//		
//		// Add the switch
//		UISwitch* footerSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(215.0, 5, 80.0, 45.0)];
//		[footerView addSubview: footerSwitch];
//		
//		// Return the footerView
//		return footerView;
//	}
//	else return nil;
//}
//// Need to call to pad the footer height otherwise the footer collapses
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//	switch (section) {
//		case 0:
//			return 60.0;
//		case 1:
//			return 60.0;
//		default:
//			return 0.0;
//	}
//}



@end


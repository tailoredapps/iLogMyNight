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
@synthesize tableView;
@synthesize imageView;
@synthesize txt_location;
@synthesize tb_navbar;
@synthesize tbi_analyse;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	imageView.image = [UIImage imageNamed:@"gradientback.png"];

	tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	tableView.backgroundColor = [UIColor clearColor];

	
	UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gradient_cell.png"]];
	[tb_navbar addSubview:background];
	[tb_navbar sendSubviewToBack:background];
	
	tbi_analyse.image = [UIImage imageNamed:@"Icon_Wein.png"];
	
	
	//
    // Create a header view. Wrap it in a container to allow us to position
    // it better.
    //
//    UIView *containerView =
//	[[[UIView alloc]
//	  initWithFrame:CGRectMake(0, 0, 300, 60)]
//	 autorelease];
//    UILabel *headerLabel =
//	[[[UILabel alloc]
//	  initWithFrame:CGRectMake(10, 20, 300, 40)]
//	 autorelease];
//    headerLabel.text = NSLocalizedString(@"LogMyNight - Title", @"");
//    headerLabel.textColor = [UIColor whiteColor];
//    headerLabel.shadowColor = [UIColor blackColor];
//    headerLabel.shadowOffset = CGSizeMake(0, 1);
//    headerLabel.font = [UIFont boldSystemFontOfSize:22];
//    headerLabel.backgroundColor = [UIColor clearColor];
//    [containerView addSubview:headerLabel];
//    self.tableView.tableHeaderView = containerView;
	
//	tableView.rowHeight = 50;
	
 	provider = [[DrinkProvider alloc] init];
	
	
	//[provider release];
}

-(IBAction)analyse:(id)sender{
//
//	AnalyseViewController *analyseView = [[AnalyseViewController alloc] initWithNibName:@"AnalyseViewController" bundle:[NSBundle mainBundle]];
//	self.navigationItem.title = @"Back";
//	[self.navigationController pushViewController:analyseView animated:YES];
//	[analyseView release];
	
	DrinkHistoryProvider* hprovider = [[DrinkHistoryProvider alloc] init];
	
	NSMutableArray *diagramdata = [hprovider loadEntriesAll];	
	
	
	
	
	
	
	DiagramViewController *diagramView = [[DiagramViewController alloc] initWithNibName:@"DiagramView" bundle:[NSBundle mainBundle]];
	self.navigationItem.title = @"Back";
	NSInteger maxVal = 0;
	diagramView.dataentries = [[NSMutableArray alloc] init];
	for(int i=0; i < [diagramdata count]; i++)
	{
		DrinkHistory *item = [diagramdata objectAtIndex:i];
		ABDiagramData *entry = [[ABDiagramData alloc] initWithData:item.drinkname:item.amount];

		[diagramView.dataentries addObject:entry];
		if(entry.amount > maxVal)
			maxVal = entry.amount;
		
		[entry release];
	}
	diagramView.maxValue = maxVal;
	[diagramdata release];
	
	[self.navigationController pushViewController:diagramView animated:YES];
	[diagramView release];
	
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
- (UITableViewCell *)tableView:(UITableView *)atableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [atableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];



    }
	NSLog(@"Drink: %@ index %d" , [provider drinkAtIndex:[indexPath row]], [indexPath row]);
	Drink *drink = [provider drinkAtIndex:[indexPath row]];
	
	UIImage *indicatorImage = [UIImage imageNamed:@"indicator.png"];
	cell.accessoryView = [[[UIImageView alloc] initWithImage:indicatorImage] autorelease];
	cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gradient_cell.png"]];
	cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gradient_cellselected.png"]];
	[[cell textLabel] setText:[drink name]];
	[cell textLabel].textColor = [UIColor whiteColor];
	NSLog(@"Drink added to table");

	
	if ([[drink type] isEqualToString:@"Bier"]) {
		cell.imageView.image = [UIImage imageNamed:@"Icon_Bier.png"];
	}
	
	if ([[drink type] isEqualToString:@"Wein"]) {
		cell.imageView.image = [UIImage imageNamed:@"Icon_Wein.png"];
	}
	
	if ([[drink type] isEqualToString:@"Cocktail"]) {
		cell.imageView.image = [UIImage imageNamed:@"Icon_Cocktail.png"];
	}
	
	if ([[drink type] isEqualToString:@"Shot"]) {
		cell.imageView.image = [UIImage imageNamed:@"Icon_Shot.png"];
	}
	
	if ([[drink type] isEqualToString:@"Anti"]) {
		cell.imageView.image = [UIImage imageNamed:@"Icon_Anti.png"];
	}
	
	
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
	
	Drink *drink = [provider drinkAtIndex:[indexPath row]];
	[detailView.lbl_name setText:[drink name]];
	
	
	if ([[drink type] isEqualToString:@"Bier"]) {
		detailView.img_pic.image = [UIImage imageNamed:@"Icon_Bier_big.png"];
	}
	
	if ([[drink type] isEqualToString:@"Wein"]) {
		detailView.img_pic.image = [UIImage imageNamed:@"Icon_Wein_big.png"];
	}
	
	if ([[drink type] isEqualToString:@"Cocktail"]) {
		detailView.img_pic.image = [UIImage imageNamed:@"Icon_Cocktail_big.png"];
	}
	
	if ([[drink type] isEqualToString:@"Shot"]) {
		detailView.img_pic.image = [UIImage imageNamed:@"Icon_Shot_big.png"];
	}
	
	if ([[drink type] isEqualToString:@"Anti"]) {
		detailView.img_pic.image = [UIImage imageNamed:@"Icon_Anti_big.png"];
	}
	
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


//
//  DetailViewController.m
//  LogMyNight
//
//  Created by junterguggenberger on 13.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//

#import "DetailViewController.h"


@implementation DetailViewController

@synthesize name;

-(IBAction)increaseCounter:(id)sender{
	NSLog(@"+1");
}

-(IBAction)backToDrinks:(id)sender {
	NSLog(@"back");
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	self.name.text = @"test"; 
	//self.navigationItem.leftBarButtonItem =
	//[[UIBarButtonItem alloc] initWithTitle:@"Back"
//									 style:UIBarButtonItemStyleBordered
//									target:self
//									action:@selector(handleBack:)];
	
	self.navigationItem.title = @"Replacement Title";

}

- (void) handleBack:(id)sender
{
    // do your custom handler code here
	
    // make sure you do this!
	// pop the controller
    [self.navigationController popViewControllerAnimated:YES];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

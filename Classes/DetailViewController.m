//
//  DetailViewController.m
//  LogMyNight
//
//  Created by junterguggenberger on 13.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//

#import "DetailViewController.h"



@implementation DetailViewController

@synthesize lbl_name;
@synthesize txt_sliderval;
@synthesize sliderval;
@synthesize provider;
@synthesize slider;
@synthesize btn_logit;
@synthesize btn_up;
@synthesize btn_down;
@synthesize lbl_amount;

-(void)setName:(NSString *)as:value{
	[self.lbl_name setText:value];
}

-(IBAction)logit:(id)sender{
	NSLog(@"LogIt");
	
	Drink* drink = [[Drink alloc] init];
	drink.name = lbl_name.text;
	
	Float32 price = [txt_sliderval.text floatValue] * [lbl_amount.text intValue];
	
	//Log the Price and the drink in the database
	[provider logDrinkHistory:drink andPrice:(Float32)price];
	
	//Push the RootView again
	RootViewController *rootView = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:[NSBundle mainBundle]];
	self.navigationItem.title = @"Back";
	[self.navigationController pushViewController:rootView animated:YES];
	[rootView release];
	
}
-(IBAction)amountIncrease:(id)sender{
//	NSLog(@"+1");
	amount += 1;
	[lbl_amount setText:[NSString stringWithFormat:@"%d",amount]];
}
-(IBAction)amountDecrease:(id)sender{
//	NSLog(@"-1");
	amount --;
	[lbl_amount setText:[NSString stringWithFormat:@"%d",amount]];
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
	//self.navigationItem.leftBarButtonItem =
	//[[UIBarButtonItem alloc] initWithTitle:@"Back"
//									 style:UIBarButtonItemStyleBordered
//									target:self
//									action:@selector(handleBack:)];
	
	self.navigationItem.title = @"Replacement Title";
	
	self.provider = [[DrinkHistoryProvider alloc] init];
	amount = 1;
	

}

-(void)handleSlider:(id)sender{
//	NSLog([NSString stringWithFormat:@"slidervalue changed %f",slider.value]);
	
	//auf 2 Kommastellen rechnen
	int slidervalmaxi = (slider.value * 100);
	float slidervalrounded = (float)slidervalmaxi/100;
	
	float txtvalue = [[txt_sliderval text] floatValue];
	float nextStep = txtvalue + 0.05;
	float lastStep = txtvalue - 0.05;
	
//	NSLog([NSString stringWithFormat:@"val1 %f",nextStep]);
//	NSLog([NSString stringWithFormat:@"val2 %f",lastStep]);

	
	if(slidervalrounded >= nextStep)
	{
		[txt_sliderval setText:[NSString stringWithFormat:@"%f", nextStep]];
	}
	if(slidervalrounded <= lastStep){
		[txt_sliderval setText:[NSString stringWithFormat:@"%f", lastStep]];
	}

	
	
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
	[provider release];
	[slider release];
    [super dealloc];
}


@end

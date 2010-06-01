//
//  RootViewController.h
//  LogMyNight
//
//  Created by junterguggenberger on 11.04.10.
//  Copyright ToolsOnAir 2010. All rights reserved.
//

#import "DrinkProvider.h"
#import "Drink.h"
#import "DetailViewController.h"
#import "AnalyseViewController.h"


@interface RootViewController : UIViewController {
	DrinkProvider *provider;
	UITableView *tableView;
	UIImageView *imageView;
	UITextField *txt_location;
}

-(IBAction)analyse:(id)sender;

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property(nonatomic, retain) DrinkProvider *provider;
@property (nonatomic, retain) IBOutlet UITextField *txt_location;
@end

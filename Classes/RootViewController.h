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

@interface RootViewController : UITableViewController {
	DrinkProvider *provider;
}

-(IBAction)analyse:(id)sender;

@property(nonatomic, retain) DrinkProvider *provider;
@end

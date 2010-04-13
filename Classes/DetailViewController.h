//
//  DetailViewController.h
//  LogMyNight
//
//  Created by junterguggenberger on 13.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController {

	IBOutlet UILabel* name; 
	IBOutlet UIButton* btn;
}
-(IBAction)increaseCounter:(id)sender;
-(IBAction)backToDrinks:(id)sender;

@property (assign) UILabel* name;
@end

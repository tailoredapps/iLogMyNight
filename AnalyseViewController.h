//
//  AnalyseViewController.h
//  LogMyNight
//
//  Created by junterguggenberger on 20.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrinkHistoryProvider.h"


@interface AnalyseViewController : UITableViewController {

	DrinkHistoryProvider* provider;
}

@property (nonatomic, retain) DrinkHistoryProvider* provider;
@end

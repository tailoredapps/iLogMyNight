//
//  DrinkProvider.h
//  LogMyNight
//
//  Created by junterguggenberger on 11.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Drink.h"
#import "DBConnectionManager.h"


@interface DrinkProvider : NSObject {
	NSMutableArray *drinks;
	NSManagedObjectContext *context;
	NSFetchedResultsController *fetchedResultsController;
}

-(Drink*) drinkAtIndex:(NSInteger) index;
-(NSUInteger) size;
-(id) init;
-(void) dealloc;

@property (nonatomic, retain) NSMutableArray *drinks;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end

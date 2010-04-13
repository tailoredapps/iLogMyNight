//
//  DrinkProvider.h
//  LogMyNight
//
//  Created by junterguggenberger on 11.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Drink.h"


@interface DrinkProvider : NSObject {
	NSArray *drinks;
	NSManagedObjectContext *context;
	NSFetchedResultsController *fetchedResultsController;
}

-(Drink*) getDrink:(NSInteger) index;
-(NSUInteger) size;
-(id) init;
-(void) dealloc;
- (void) initCoreData;
- (void) fetchDrinks;

@property (nonatomic, retain) NSArray *drinks;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end

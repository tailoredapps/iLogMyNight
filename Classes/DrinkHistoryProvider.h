//
//  DrinkCounterProvider.h
//  LogMyNight
//
//  Created by junterguggenberger on 15.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrinkHistory.h"
#import "Drink.h"
#import "DBConnectionManager.h"

@interface DrinkHistoryProvider : NSObject {
	NSMutableArray *counts;
	NSManagedObjectContext *context;
	NSFetchedResultsController *fetchedResultsController;

}


//for the logging
-(id) init;
-(void) dealloc;
-(void) logDrinkHistory:(Drink*)drink andPrice:(Float32)price andAmount:(NSInteger)amount;

//for the analyseview
-(NSInteger) size;
-(DrinkHistory*)itemAtIndex:(NSInteger)index;

@property (nonatomic, retain) NSMutableArray *counts;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end

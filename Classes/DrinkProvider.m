//
//  DrinkProvider.m
//  LogMyNight
//
//  Created by junterguggenberger on 11.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//

#import "DrinkProvider.h"


@implementation DrinkProvider

@synthesize drinks;
@synthesize fetchedResultsController;

-(Drink*) drinkAtIndex:(NSInteger) index{
	return [drinks objectAtIndex:index];
}

/*Fetch the Drinks and store them in the NSMutableArray drinks*/
-(id) init{
	if((self = [super init]) == nil)
		return nil;
	
	self.drinks = [[NSMutableArray alloc] init];

	
	sqlite3 *db = [DBConnectionManager sharedConnection];
	sqlite3_stmt *statement = nil;
	const char *sql = "select * from Drink";
	if(sqlite3_prepare_v2(db, sql, -1, &statement, NULL)!=SQLITE_OK)
		NSAssert1(0,@"Error preparing statement",sqlite3_errmsg(db));
	else {

			while(sqlite3_step(statement) == SQLITE_ROW)
			{
				Drink* toAdd = [[Drink alloc] init];
				[toAdd setName:[NSString stringWithFormat:@"%s",(char*)sqlite3_column_text(statement,0)]];
				[drinks addObject:toAdd];
			}

//		if([drinks count] < 1) {
//			NSArray *drinknames = [[NSArray alloc] initWithObjects:@"Bier",@"Wein",@"Cocktail",nil];
//			statement = nil;
//			const char *sql ="insert into Drink values(?,?,?)";
//
//			
//			for (int i = 0; i < [drinknames count]; i++) {
//				if(sqlite3_prepare_v2(db, sql, -1, &statement, NULL) != SQLITE_OK){
//					printf( "could not prepare statemnt: %s", sqlite3_errmsg(db));
//					NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(db));
//				}
//				sqlite3_bind_text(statement, 1, [[drinknames objectAtIndex:i] UTF8String], -1, SQLITE_TRANSIENT);
//				sqlite3_bind_double(statement, 2, 12.2f);
//				sqlite3_bind_double(statement, 2, 12.4f);
//				
//				if(SQLITE_DONE != sqlite3_step(statement)){
//					printf( "Error while inserting data: %s", sqlite3_errmsg(db));
//					NSAssert1(0, @"Error while inserting data. '%s'", sqlite3_errmsg(db));
//				}
//			}
//
//		}

	}
	

	
	NSLog(@"drinks retainCount is: %d",[drinks retainCount]);
	
	
	return self;
}

- (void) fetchDrinks {
	sqlite3 *db = [DBConnectionManager sharedConnection];
	sqlite3_stmt *statement = nil;
	const char *sql = "select * from Drink";
	if(sqlite3_prepare_v2(db, sql, -1, &statement, NULL)!=SQLITE_OK)
		NSAssert1(0,@"Error preparing statement",sqlite3_errmsg(db));
	else {
		while(sqlite3_step(statement) == SQLITE_ROW)
			[drinks addObject:[NSString stringWithFormat:@"%s",(char*)sqlite3_column_text(statement,1)]];
	}
	sqlite3_finalize(statement);
}

-(void)dealloc{
	[context release];
	[fetchedResultsController release];
	[drinks release];
	[super dealloc];	
}

-(NSUInteger)size{
	return [drinks count];
}

@end

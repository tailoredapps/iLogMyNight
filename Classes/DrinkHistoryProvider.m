//
//  DrinkCounterProvider.m
//  LogMyNight
//
//  Created by junterguggenberger on 15.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//

#import "DrinkHistoryProvider.h"


@implementation DrinkHistoryProvider
@synthesize counts;
@synthesize fetchedResultsController;

-(id) init{
	if((self = [super init]) == nil)
		return nil;
	
	self.counts = [[NSMutableArray alloc] init];
	sqlite3 *db = [DBConnectionManager sharedConnection];
	sqlite3_stmt *statement = nil;
	const char *sql2 = "select * from DrinkHistory";
	if(sqlite3_prepare_v2(db, sql2, -1, &statement, NULL)!=SQLITE_OK)
		NSAssert1(0,@"Error preparing statement",sqlite3_errmsg(db));
	else {
		
		while(sqlite3_step(statement) == SQLITE_ROW)
		{
			DrinkHistory* item = [[DrinkHistory alloc] init];
			item.drinkname = [NSString stringWithFormat:@"%s",(char*)sqlite3_column_text(statement,1)];
			item.price = sqlite3_column_double(statement,2);
			
			
			NSDateFormatter *df = [[NSDateFormatter alloc] init];
			[df setDateFormat:@"yyyy-MM-dd hh:mm:ss a"];
			item.timestamp = [df dateFromString: [NSString stringWithFormat:@"%s",(char*)sqlite3_column_text(statement,3)]];
			[counts addObject:item];
			[df release];
			[item release];
		}
	}
	[counts release];
	return self;
}

-(void) logDrinkHistory:(Drink*)drink andPrice:(Float32)price{
	sqlite3 *db = [DBConnectionManager sharedConnection];
	sqlite3_stmt *statement = nil;
	
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	[df setDateFormat:@"yyyy-MM-dd hh:mm:ss a"];
	NSString* todaydate = [df stringFromDate:[NSDate date]];
	[df release];
	const char *sql ="insert into DrinkHistory values(NULL,(Select name from Drink where name=?), ?, ?)";
	if(sqlite3_prepare_v2(db, sql, -1, &statement, NULL) != SQLITE_OK){
		printf( "could not prepare statemnt: %s", sqlite3_errmsg(db));
		NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(db));
	}

	sqlite3_bind_text(statement, 1, [[drink name] UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_double(statement, 2, price);
	sqlite3_bind_text(statement, 3, [todaydate UTF8String] , -1, SQLITE_TRANSIENT);
		
	if(SQLITE_DONE != sqlite3_step(statement)){
		printf( "Error while inserting data: %s", sqlite3_errmsg(db));
		NSAssert1(0, @"Error while inserting data. '%s'", sqlite3_errmsg(db));
	}
	
	statement = 0;

		
	
	
}
	
-(void)dealloc{
	[context release];
	[fetchedResultsController release];
	[counts release];
	[super dealloc];	
}

-(NSInteger) size{
	return [counts count];
}
-(DrinkHistory*)itemAtIndex:(NSInteger)index{
	return [counts objectAtIndex:index];
}


@end

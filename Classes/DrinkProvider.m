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
-(NSString*) getDrink:(NSInteger) index{
	return (NSString*)[drinks objectAtIndex:index];
}

-(id) init{
	if((self = [super init]) == nil)
		return nil;
	
	drinks = [[NSArray alloc] initWithObjects:@"Bier", @"Wein", @"Cocktail", nil];
	[self initCoreData];
	[self addObjects];
	
	return self;
}

- (void) initCoreData {
	NSError *error;
	// Path to sqlite file. 
	NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/logMyNight.sqlite"]; 
	NSURL *url = [NSURL fileURLWithPath:path];
	
	// Init the model 
	NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
	
	// Establish the persistent store coordinator
	NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
	if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error])
		NSLog(@"Error %@", [error localizedDescription]);
	else {
		// Create the context and assign the coordinator 
		context = [[[NSManagedObjectContext alloc] init] autorelease]; 
		[context setPersistentStoreCoordinator:persistentStoreCoordinator]; 
		[persistentStoreCoordinator release];
	}
}

-(void) addObjects {
	// Add a new department 
	Drink *drink = (Drink *)[NSEntityDescription
							insertNewObjectForEntityForName:@"Drink"
							inManagedObjectContext:context]; 
	drink.name = @"Bier";
	
	drink = (Drink *)[NSEntityDescription
					   insertNewObjectForEntityForName:@"Drink"
					   inManagedObjectContext:context]; 
	drink.name = @"Cocktail";
	
	drink = (Drink *)[NSEntityDescription
					   insertNewObjectForEntityForName:@"Drink"
					   inManagedObjectContext:context]; 
	drink.name = @"Wein";
	
	// Save out to the persistent store
	NSError *error; 
	if (![context save:&error])
		NSLog(@"Error %@", [error localizedDescription]);
}

-(void)dealloc{

	[drinks release];
	[super dealloc];	
}

-(NSUInteger)size{

	return [drinks count];
}

@end

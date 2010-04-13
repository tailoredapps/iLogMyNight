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

-(Drink*) getDrink:(NSInteger) index{
	//return (NSString*)[drinks objectAtIndex:index];
	
	return (Drink*)[fetchedResultsController.fetchedObjects objectAtIndex:index];
}

-(id) init{
	if((self = [super init]) == nil)
		return nil;
	
	drinks = [[NSArray alloc] initWithObjects:@"Bier", @"Wein", @"Cocktail", nil];
	[drinks release];
	
	[self initCoreData];
//	[self addObjects];
	[self fetchDrinks]; 
	
	return self;
}

- (void) fetchDrinks {
	// Create a basic fetch request 
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init]; 
	[fetchRequest setEntity:[NSEntityDescription
							 entityForName:@"Drink" inManagedObjectContext:context]];
	
	// Add a sort descriptor. Mandatory. 
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
										initWithKey:@"name" ascending:YES selector:nil]; 
	NSArray *descriptors = [NSArray arrayWithObject:sortDescriptor]; 
	[fetchRequest setSortDescriptors:descriptors]; 
	[sortDescriptor release];
	
	// Init the fetched results controller 
	NSError *error; 
	
	//NSLog(@"fetchedResultsController retainCount %d", [fetchedResultsController retainCount]);
	
	self.fetchedResultsController = [[NSFetchedResultsController alloc]
									 initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:@"Root"];
	if (![fetchedResultsController performFetch:&error]) 
		NSLog(@"Error %@", [error localizedDescription]);
	
	NSLog(@"fetchedResultsController1 retainCount %d", [self.fetchedResultsController retainCount]);
	
	[self.fetchedResultsController release]; 
	
	NSLog(@"fetchedResultsController2 retainCount %d", [self.fetchedResultsController retainCount]);
	
	[fetchRequest release];
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
	[fetchedResultsController release];
	[drinks release];
	[super dealloc];	
}

-(NSUInteger)size{
	return [fetchedResultsController.fetchedObjects count];
}

@end

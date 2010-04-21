//
//  DBConnectionManager.m
//  LogMyNight
//
//  Created by junterguggenberger on 17.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//

#import "DBConnectionManager.h"


@implementation DBConnectionManager

static sqlite3*	sharedSqlite3DBConnection=0;

// Should be considered private to the abstract singleton class, 
// wrap with a "sharedXxx" class method
+ (sqlite3*)sharedConnection
{
    return [self sharedConnectionWithZone:[self zone]];
}

// Should be considered private to the abstract singleton class
+ (sqlite3*)sharedConnectionWithZone:(NSZone*)zone
{
    @synchronized([DBConnectionManager class]) {
        if (sharedSqlite3DBConnection == 0) {

			NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
			
			NSString *documentsDirectory = [paths objectAtIndex:0];
			
			NSString *path = [documentsDirectory stringByAppendingPathComponent:@"LogMyNightDB.sqlite"];
			
			// Open the database. The database was prepared outside the application.
			
			if (sqlite3_open([path UTF8String], &sharedSqlite3DBConnection) == SQLITE_OK) {
				NSLog(@"Database Successfully Opened");
			} 
			else {
				NSLog(@"Error in opening database");
			}
        }
    }
    return sharedSqlite3DBConnection;
}


// Designated initializer for instances. If subclasses override they must call this implementation.
//
// Alloc the rules-dictionary.
//
+(void) initialize
{
	NSLog(@"Creating editable copy of database");
	
	// First, test for existence.
	
	BOOL success;
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	NSError *error;
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	NSString *documentsDirectory = [paths objectAtIndex:0];
	
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"LogMyNightDB.sqlite"];
	
	success = [fileManager fileExistsAtPath:writableDBPath];
	
	if (success) return;
	
	// The writable database does not exist, so copy the default to the appropriate location.
	
	NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"LogMyNightDB.sqlite"];
	
	success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
	
	if (!success) {
		
		NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
	}
}

+ (void) finalize {
	NSLog(@"finalize");
	if(sharedSqlite3DBConnection != 0) 
	{
		NSLog(@"CloseDB");
		sqlite3_close(sharedSqlite3DBConnection);
	}
}

// Disallow the normal default initializer for instances.
- (id)init
{
    [self doesNotRecognizeSelector:_cmd];
	return nil;
}


// cleanup, but will probably never be called
-(void) dealloc
{
	[super dealloc];
}


// ------------------------------------------------------------------------------
// The following overrides attempt to enforce singleton behavior.

- (id)copy
{
    [self doesNotRecognizeSelector:_cmd]; //optional, do if you want to force certain usage pattern
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    //[self doesNotRecognizeSelector:_cmd]; //optional, do if you want to force certain usage pattern
    return self;
}

- (id)mutableCopy
{
    //[self doesNotRecognizeSelector:_cmd]; //optional, do if you want to force certain usage pattern
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    //[self doesNotRecognizeSelector:_cmd]; //optional, do if you want to force certain usage pattern
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

- (oneway void)release
{
}

- (id)retain
{
    return self;
}

- (id)autorelease
{
    return self;
}

// ------------------------------------------------------------------------------




	
	
@end

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
}

-(NSString*) getDrink:(NSInteger) index;
-(NSUInteger) size;
-(id) init;
-(void) dealloc;
- (void) initCoreData;

@property (nonatomic, retain) NSArray *drinks;

@end

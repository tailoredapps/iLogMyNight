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
	
	return self;
}

-(void)dealloc{

	[drinks release];
	[super dealloc];	
}

-(NSUInteger)size{

	return [drinks count];
}

@end

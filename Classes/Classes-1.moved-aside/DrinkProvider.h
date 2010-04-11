/*
 *  DrinkProvider.h
 *  LogMyNight
 *
 *  Created by junterguggenberger on 11.04.10.
 *  Copyright 2010 ToolsOnAir. All rights reserved.
 *
 */

@interface DrinkProvider : NSObject {
	NSArray *drinks;
}

-(NSString) getDrink:(NSInteger) index;

@property (nonatomic, retain) NSArray *drinks;

@end


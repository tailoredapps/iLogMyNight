//
//  DrinkCounter.h
//  LogMyNight
//
//  Created by junterguggenberger on 15.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface DrinkHistory :  NSObject  
{
	double price;
	NSDate * timestamp;
	NSString* drinkname;
}

@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) NSString* drinkname;
@property (assign) double price;

@end




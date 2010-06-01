//
//  Drink.h
//  LogMyNight
//
//  Created by junterguggenberger on 15.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Drink :  NSObject  
{
	NSString *name;
	NSString *type;
	Float32 preis;
	Float32 letzterpreis;
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * type;

@end




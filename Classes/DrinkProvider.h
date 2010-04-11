//
//  DrinkProvider.h
//  LogMyNight
//
//  Created by junterguggenberger on 11.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//




@interface DrinkProvider : NSObject {
	NSArray *drinks;
}

-(NSString*) getDrink:(NSInteger) index;
-(NSUInteger) size;
-(id) init;
-(void) dealloc;

@property (nonatomic, retain) NSArray *drinks;

@end

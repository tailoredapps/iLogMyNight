//
//  DBConnectionManager.h
//  LogMyNight
//
//  Created by junterguggenberger on 17.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBConnectionManager : NSObject {

}

+(sqlite3*) sharedConnection;
+(sqlite3*) sharedConnectionWithZone:(NSZone*)zone;

//designated initializer, subclasses must implement and call supers implementation
+(void) initialize;
+ (void) finalize;



@end

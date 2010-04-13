//
//  LogMyNightAppDelegate.h
//  LogMyNight
//
//  Created by junterguggenberger on 11.04.10.
//  Copyright ToolsOnAir 2010. All rights reserved.
//

@interface LogMyNightAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;

}


@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;


@end


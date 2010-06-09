//
//  DiagramViewController.h
//  LogMyNight
//
//  Created by Hannes Satz on 08/06/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CorePlot-CocoaTouch.h"
#import "ABDiagramData.h"


@interface DiagramViewController : UIViewController <CPPlotDataSource> {

	CPXYGraph *barChart;
	NSMutableArray *dataentries;
	NSMutableArray* barcolors;
	NSInteger maxValue;
}

@property (assign) NSMutableArray *dataentries;
@property (assign) NSMutableArray* barcolors; 
@property (assign) NSInteger maxValue;
@end

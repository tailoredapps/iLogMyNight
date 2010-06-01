//
//  DetailViewController.h
//  LogMyNight
//
//  Created by junterguggenberger on 13.04.10.
//  Copyright 2010 ToolsOnAir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrinkHistoryProvider.h"
#import "RootViewController.h"

@interface DetailViewController : UIViewController {

	IBOutlet UILabel* lbl_name; 
	IBOutlet UILabel* lbl_preis; 
	IBOutlet UILabel* lbl_x; 
	IBOutlet UILabel* sliderval;
	IBOutlet UITextField* txt_sliderval;
	IBOutlet UIButton* btn_logit;
	IBOutlet UIButton* btn_up;
	IBOutlet UIButton* btn_down;
	IBOutlet UISlider* slider;
	IBOutlet UILabel* lbl_amount;
	IBOutlet UIImageView* img_pic;
	DrinkHistoryProvider* provider;
	NSInteger amount;
//	NSManagedObjectContext *context;
}
-(IBAction)logit:(id)sender;
-(IBAction)amountIncrease:(id)sender;
-(IBAction)amountDecrease:(id)sender;
-(IBAction)backToDrinks:(id)sender;
-(IBAction)handleSlider:(id)sender;
-(void)setName:(NSString *)as:value;

@property (nonatomic, retain) UILabel* lbl_name;
@property (nonatomic, retain) UILabel* lbl_preis;
@property (nonatomic, retain) UILabel* lbl_x;
@property (nonatomic, retain) UILabel* sliderval;
@property (nonatomic, retain) UISlider* slider;
@property (retain) DrinkHistoryProvider* provider;
@property (nonatomic, retain) UITextField* txt_sliderval;
@property (nonatomic, retain) IBOutlet UIButton* btn_logit;
@property (nonatomic, retain) IBOutlet UIButton* btn_up;
@property (nonatomic, retain) IBOutlet UIButton* btn_down;
@property (nonatomic, retain) UILabel* lbl_amount;
@property (nonatomic, retain) UIImageView* img_pic;
@end

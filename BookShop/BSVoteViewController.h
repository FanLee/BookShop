//
//  BSVoteViewController.h
//  BookShop
//
//  Created by FanLee on 18.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSVoteViewController : UIViewController
@property(nonatomic,strong)IBOutlet UIButton* starButton1;
@property(nonatomic,strong)IBOutlet UIButton* starButton2;
@property(nonatomic,strong)IBOutlet UIButton* starButton3;
@property(nonatomic,strong)IBOutlet UIButton* starButton4;
@property(nonatomic,strong)IBOutlet UIButton* starButton5;
@property(nonatomic,strong) UIImage* activeStar;
@property(nonatomic,strong) UIImage* inactiveStar;
@property(nonatomic,strong) NSArray* buttonsArray;
@property(nonatomic,assign) NSUInteger starRating;
-(IBAction)starButtonAction:(id)sender;
-(IBAction)saveRatingAction:(id)sender;

@end

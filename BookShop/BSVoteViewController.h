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
@property(nonatomic,strong)IBOutlet UIImage* activeStar;
@property(nonatomic,strong)IBOutlet UIImage* inactiveStar;
@property(nonatomic, strong) NSArray* buttonsArray;
-(IBAction)starButton1Action:(id)sender;
-(IBAction)starButton2Action:(id)sender;
-(IBAction)starButton3Action:(id)sender;
-(IBAction)starButton4Action:(id)sender;
-(IBAction)starButton5Action:(id)sender;

@end

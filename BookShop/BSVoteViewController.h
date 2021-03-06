//
//  BSVoteViewController.h
//  BookShop
//
//  Created by FanLee on 18.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Author.h"
#import "User.h"
#import "UsersAuthorRating.h"
//@class Author,User,UsersAuthorRating;

@interface BSVoteViewController : UIViewController
@property(nonatomic,strong)IBOutlet UIButton* starButton1;
@property(nonatomic,strong)IBOutlet UIButton* starButton2;
@property(nonatomic,strong)IBOutlet UIButton* starButton3;
@property(nonatomic,strong)IBOutlet UIButton* starButton4;
@property(nonatomic,strong)IBOutlet UIButton* starButton5;
@property(nonatomic,strong)IBOutlet UILabel* ratingLabel;
@property(nonatomic,strong) UIImage* activeStar;
@property(nonatomic,strong) UIImage* inactiveStar;
@property(nonatomic,strong) NSArray* buttonsArray;
@property(nonatomic,assign) NSInteger starRating;
@property(nonatomic,strong)Author *author;
-(IBAction)starButtonAction:(id)sender;
-(IBAction)saveRatingAction:(id)sender;
-(void)addRating:(int)rating;

@end

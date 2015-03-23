//
//  BSAuthorViewController.h
//  BookShop
//
//  Created by FanLee on 18.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSVoteViewController.h"
#import "Author.h"
#import "Book.h"

@interface BSAuthorViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)Author * author;
@property(nonatomic,strong)IBOutlet UIButton* starButton1;
@property(nonatomic,strong)IBOutlet UIButton* starButton2;
@property(nonatomic,strong)IBOutlet UIButton* starButton3;
@property(nonatomic,strong)IBOutlet UIButton* starButton4;
@property(nonatomic,strong)IBOutlet UIButton* starButton5;
@property(nonatomic,strong)IBOutlet UITableView *tablewiev;
@property(nonatomic,strong)IBOutlet UIImageView* authorPortrait;
@property(nonatomic,strong)IBOutlet UILabel* authorNameLabel;
@property(nonatomic,strong)IBOutlet UILabel* authorGenderLabel;
@property(nonatomic,strong)IBOutlet UILabel* authorBirtDate;
@property(nonatomic,strong)IBOutlet UILabel* authorGenreLabel;
@property(nonatomic,strong)IBOutlet UILabel* ratingLabel;
@property(nonatomic,strong) UIImage* activeStar;
@property(nonatomic,strong) UIImage* inactiveStar;
@property(nonatomic,strong) NSArray* buttonsArray;
-(IBAction)starButton:(id)sender;
@property(nonatomic,assign)NSInteger authorsRating;
@property(nonatomic,weak)id delegate;
@end

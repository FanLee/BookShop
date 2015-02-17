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

@interface BSAuthorViewController : UIViewController
@property(nonatomic,retain)Author * author;
@property(nonatomic,strong)IBOutlet UIImageView* authorPortrait;
@property(nonatomic,strong)IBOutlet UILabel* authorNameLabel;
@property(nonatomic,strong)IBOutlet UILabel* authorGenderLabel;
@property(nonatomic,strong)IBOutlet UILabel* authorBirtDate;
@property(nonatomic,strong)IBOutlet UILabel* authorGenreLabel;
-(IBAction)starButton:(id)sender;
@property(nonatomic,assign)NSUInteger authorsRating;
@property(nonatomic,weak)id delegate;
@end

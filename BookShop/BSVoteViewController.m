//
//  BSVoteViewController.m
//  BookShop
//
//  Created by FanLee on 18.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import "BSVoteViewController.h"
#import "AppDelegate.h"
#import "BSDBManager.h"
#import "User.h"
#import "Author.h"
#import "BSAuthorViewController.h"
#import "UsersAuthorRating.h"

@interface BSVoteViewController ()

@end

@implementation BSVoteViewController

float rating;
- (void)viewDidLoad {
    [super viewDidLoad];
    BSDBManager *dbManager = [BSDBManager sharedInstance];
    rating=[dbManager recalcRating:_author.name];
    _activeStar=[UIImage imageNamed:@"ActiveStar.png"];
    _inactiveStar=[UIImage imageNamed:@"InActiveStar.png"];
    _buttonsArray=[[NSArray alloc]initWithObjects:_starButton1,_starButton2,_starButton3,_starButton4,_starButton5, nil];
    [self determineButtonForRating:rating];
    _starRating = 0;
    _ratingLabel.text=[NSString stringWithFormat:@"%.02f",rating];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(IBAction)starButtonAction:(id)sender{
    [self changeButtonImage:sender];
    if (sender==_starButton1) {
        _starRating=1;
    }else if (sender==_starButton2){
        _starRating=2;
    }else if (sender==_starButton3){
        _starRating=3;
    }else if (sender==_starButton4){
        _starRating=4;
    }else if (sender==_starButton5){
        _starRating=5;
    }
}
-(void)determineButtonForRating:(float)rating{
    if (rating>=1&&rating<2) {
        [self changeButtonImage:_starButton1];
    }else if (rating>=2&&rating<3){
        [self changeButtonImage:_starButton2];
    }else if (rating>=3&&rating<4){
        [self changeButtonImage:_starButton3];
    }else if (rating>=4&&rating<5){
        [self changeButtonImage:_starButton4];
    }else if (rating>=5){
        [self changeButtonImage:_starButton5];
    }
}

-(void)changeButtonImage:(UIButton*)starButton{
    NSUInteger index = [_buttonsArray indexOfObject:starButton];
    for (int i=0; i<[_buttonsArray count]; i++) {
        if(i<=index){
            [[_buttonsArray objectAtIndex:i] setImage:_activeStar forState:UIControlStateNormal];
        }else{
             [[_buttonsArray objectAtIndex:i] setImage:_inactiveStar forState:UIControlStateNormal];
        }
    }
}
-(NSManagedObjectContext *)managedObjectContext{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
-(IBAction)saveRatingAction:(id)sender{
    int starrating = (int)_starRating;
    [self addRating:starrating];
}
-(void)addRating:(int)rating{
    BSDBManager *dbManager = [BSDBManager sharedInstance];
    [dbManager newRateForAuthor:_author rate:rating];
    float recalcResult=[dbManager recalcRating:_author.name];
    _ratingLabel.text=[NSString stringWithFormat:@"%.02f",recalcResult];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue  sender:(id)sender{
    BSAuthorViewController * vc= segue.destinationViewController;
    vc.ratingLabel.text = _ratingLabel.text;
    vc.authorsRating=_starRating;
}


@end

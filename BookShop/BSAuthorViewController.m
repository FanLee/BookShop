//
//  BSAuthorViewController.m
//  BookShop
//
//  Created by FanLee on 18.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import "BSAuthorViewController.h"
#import "BSVoteViewController.h"
#import "BSDBManager.h"
#import "Book.h"
@interface BSAuthorViewController ()

@end
@implementation BSAuthorViewController

NSArray *booksArray;
float rating;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=NO;
    _buttonsArray=[NSArray arrayWithObjects:_starButton1,_starButton2,_starButton3,_starButton4,_starButton5, nil];
    _authorNameLabel.text=_author.name;
    _authorGenreLabel.text=_author.genre.genreName;
    _authorBirtDate.text=_author.birthdate;
    _authorGenderLabel.text=_author.gender;
    BSDBManager* dbManager = [BSDBManager sharedInstance];
    booksArray=[dbManager getBooksArray:_author.name];
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    booksArray=[booksArray sortedArrayUsingDescriptors:@[sortDescriptor]];
    rating= [dbManager recalcRating:_author.name];
    _ratingLabel.text=[NSString stringWithFormat:@"%.02f",rating];
    _activeStar=[UIImage imageNamed:@"ActiveStar.png"];
    _inactiveStar=[UIImage imageNamed:@"InActiveStar.png"];
    [self determineButtonForRating];
    
}
-(void)viewWillAppear:(BOOL)animated{
    BSDBManager* dbManager = [BSDBManager sharedInstance];
    _ratingLabel.text=[NSString stringWithFormat:@"%.02f",[dbManager recalcRating:_author.name]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)starButton:(id)sender{
    [self moveToVoteViewController];
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
-(void)determineButtonForRating{
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
-(void)moveToVoteViewController{
    BSVoteViewController *vc;
    vc.author=_author;
    [self performSegueWithIdentifier:@"moveToVoteViewController" sender:self];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [booksArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    for (Book * book in booksArray) {
        cell.textLabel.text=book.title;
    }
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue  sender:(id)sender{
    BSVoteViewController * vc= segue.destinationViewController;
    vc.author = _author;
}

@end

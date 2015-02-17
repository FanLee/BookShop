//
//  BSAuthorViewController.m
//  BookShop
//
//  Created by FanLee on 18.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import "BSAuthorViewController.h"
#import "BSVoteViewController.h"
@interface BSAuthorViewController ()

@end

@implementation BSAuthorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _authorNameLabel.text=_author.name;
    _authorGenreLabel.text=_author.genre.genreName;
    _authorBirtDate.text=_author.birthdate;
    _authorGenderLabel.text=_author.gender;
    //_authorsRating=_author.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)starButton:(id)sender{
    [self moveToVoteViewController];
}
-(void)moveToVoteViewController{
    [self performSegueWithIdentifier:@"moveToVoteViewController" sender:self];
    /*BSVoteViewController *voteViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"voteViewController"];
    [self presentViewController:voteViewController animated:YES completion:nil];*/
}

@end

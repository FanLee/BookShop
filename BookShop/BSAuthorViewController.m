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

//
//  BSVoteViewController.m
//  BookShop
//
//  Created by FanLee on 18.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import "BSVoteViewController.h"
#import "AppDelegate.h"

@interface BSVoteViewController ()

@end

@implementation BSVoteViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _activeStar=[UIImage imageNamed:@"ActiveStar.png"];
    _inactiveStar=[UIImage imageNamed:@"InActiveStar.png"];
    _buttonsArray=[[NSArray alloc]initWithObjects:_starButton1,_starButton2,_starButton3,_starButton4,_starButton5, nil];
    _starRating = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(IBAction)starButton1Action:(id)sender{
    [self changeButtonImage:_starButton1];
}
-(IBAction)starButton2Action:(id)sender{
    [self changeButtonImage:_starButton2];
}

-(IBAction)starButton3Action:(id)sender{
    [self changeButtonImage:_starButton3];
}

-(IBAction)starButton4Action:(id)sender{
    [self changeButtonImage:_starButton4];
}

-(IBAction)starButton5Action:(id)sender{
    //[_starButton1 setImage:_activeStar forState:UIControlStateNormal];
    [self changeButtonImage:_starButton5];
}

-(void)changeButtonImage:(UIButton*)starButton{
    //[[_buttonsArray objectAtIndex:0] setImage:_activeStar forState:UIControlStateNormal];
        if (starButton==_starButton1) {
            [[_buttonsArray objectAtIndex:0] setImage:_activeStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:1] setImage:_inactiveStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:2] setImage:_inactiveStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:3] setImage:_inactiveStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:4] setImage:_inactiveStar forState:UIControlStateNormal];
            _starRating=1;

        }else if (starButton==_starButton2){
            [[_buttonsArray objectAtIndex:0]setImage:_activeStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:1]setImage:_activeStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:2] setImage:_inactiveStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:3] setImage:_inactiveStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:4] setImage:_inactiveStar forState:UIControlStateNormal];
            _starRating=2;

        }else if (starButton==_starButton3){
            [[_buttonsArray objectAtIndex:0]setImage:_activeStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:1]setImage:_activeStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:2]setImage:_activeStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:3] setImage:_inactiveStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:4] setImage:_inactiveStar forState:UIControlStateNormal];
            _starRating=3;

        }else if (starButton==_starButton4){
            [[_buttonsArray objectAtIndex:0]setImage:_activeStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:1]setImage:_activeStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:2]setImage:_activeStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:3]setImage:_activeStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:4] setImage:_inactiveStar forState:UIControlStateNormal];
            _starRating=4;
        }else if (starButton==_starButton5){
            [[_buttonsArray objectAtIndex:0]setImage:_activeStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:1]setImage:_activeStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:2]setImage:_activeStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:3]setImage:_activeStar forState:UIControlStateNormal];
            [[_buttonsArray objectAtIndex:4]setImage:_activeStar forState:UIControlStateNormal];
            _starRating=5;
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
-(IBAction)saveButtonAction{
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSManagedObject *rating = [NSEntityDescription insertNewObjectForEntityForName:@"Rating" inManagedObjectContext:managedObjectContext];
    [rating setValue:[NSString stringWithFormat:@"%lu",(unsigned long)_starRating] forKey:@"rating"];
    
}


@end

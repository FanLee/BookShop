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
-(IBAction)starButtonAction:(id)sender{
    [self changeButtonImage:sender];
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
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSManagedObject *rating = [NSEntityDescription insertNewObjectForEntityForName:@"Rating" inManagedObjectContext:managedObjectContext];
    [rating setValue:[NSString stringWithFormat:@"%lu",(unsigned long)_starRating] forKey:@"rating"];
    
}


@end

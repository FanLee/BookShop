//
//  BSSignInViewController.m
//  BookShop
//
//  Created by FanLee on 05.11.14.
//  Copyright (c) 2014 Fan. All rights reserved.
//

#import "BSSignInViewController.h"

@interface BSSignInViewController ()


@end

@implementation BSSignInViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.emailTextField.delegate=self;
    self.signInButton.layer.borderWidth = 1;
    self.signInButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.signInButton.layer.cornerRadius = 5.0f;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidBeginEditing:(UITextField *)emailTextField {
    [self animatedTextField: emailTextField up:YES];
}

- (IBAction)em:(id)sender {
}

-(void)animatedTextField:(UITextField*)animatedTextField up:(BOOL) up
{
    const int movementDistance = 100;
    const float movementDuration = 0.3f;
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations:@"anim" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:movementDuration];
    self.view.frame=CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

@end

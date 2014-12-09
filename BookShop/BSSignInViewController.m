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
    _emailTextField.delegate=self;
    _passTextField.delegate=self;
    _signInButton.layer.borderWidth = 1;
    _signInButton.layer.borderColor = [UIColor blackColor].CGColor;
    _signInButton.layer.cornerRadius = 5.0f;
    self.navigationController.navigationBar.hidden = YES;
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [_scrollView setContentOffset:CGPointMake(0,155)animated:YES];
}

- (IBAction)signInAction:(id)sender {
    [_emailTextField resignFirstResponder];
    [_passTextField resignFirstResponder];
    
}

-(IBAction)backgroundTouched:(id)sender{
    [_emailTextField resignFirstResponder];
    [_passTextField resignFirstResponder];
    [_scrollView setContentOffset:CGPointMake(0,0)animated:YES];
}

@end


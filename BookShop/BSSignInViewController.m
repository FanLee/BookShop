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
    
    [_scrollView setContentOffset:CGPointMake(0,150)animated:YES];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    [_scrollView setContentInset:UIEdgeInsetsMake(-150,0,0,0)];
  
}


- (IBAction)signInAction:(id)sender {
    [_emailTextField resignFirstResponder];
    [_passTextField resignFirstResponder];
    [_scrollView setContentInset:UIEdgeInsetsMake(60, 0, 0, 0)];
}

@end

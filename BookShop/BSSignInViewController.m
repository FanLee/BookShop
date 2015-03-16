//
//  BSSignInViewController.m
//  BookShop
//
//  Created by FanLee on 05.11.14.
//  Copyright (c) 2014 Fan. All rights reserved.
//

#import "BSSignInViewController.h"
#import "User.h"
#import "BSDBManager.h"
#import "AppDelegate.h"
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
    [_scrollView setContentOffset:CGPointMake(0,0)animated:YES];
    [self authentification];
}
-(IBAction)backgroundTouched:(id)sender{
    [_emailTextField resignFirstResponder];
    [_passTextField resignFirstResponder];
    [_scrollView setContentOffset:CGPointMake(0,0)animated:YES];
}
-(BOOL)authentification{
    if (![_emailTextField.text isEqualToString:@""]&&![_passTextField.text isEqualToString:@""]) {
        BSDBManager* dbManager = [BSDBManager sharedInstance];
        BOOL aut = [dbManager authentification:_emailTextField.text password:_passTextField.text];
        if(aut==YES){
            AppDelegate * appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
            appDelegate.aplicationUser = [dbManager getUserFromDB:_emailTextField.text];
            //NSString* us= [NSString stringWithFormat:@"%@", appDelegate.aplicationUser.email];
            [self performSegueWithIdentifier:@"login" sender:self];
            [self.view endEditing:true];
            return true;
        }
        [self.view endEditing:true];
        UIAlertView *alertmessage=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Entered email or password wrong" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertmessage show];
        _emailTextField.text=@"";
        _passTextField.text=@"";
    }else{
        [self.view endEditing:true];
        UIAlertView *alertmessage=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Entered email or password wrong" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertmessage show];
        _emailTextField.text=@"";
        _passTextField.text=@"";
        return false;
    }
    return false;
}
@end


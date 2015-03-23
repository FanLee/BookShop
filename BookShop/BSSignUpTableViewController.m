//
//  SignUpTableViewController.m
//  BookShop
//
//  Created by FanLee on 13.11.14.
//  Copyright (c) 2014 Fan. All rights reserved.
//

#import "BSSignUpTableViewController.h"
#import "AppDelegate.h"
#import "BSDBManager.h"
#import "User.h"


@interface BSSignUpTableViewController ()


@end

@implementation BSSignUpTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (pickerView == _genderPicker){
        return 2;
    }else if(pickerView == _agePicker){
        return 5;
    }
    else return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if ( pickerView== _genderPicker) {
        if (component==0&&row==0) {
            return @"Male";
        } else {
            
            return @"Female";
        }
    }
    else if (pickerView == _agePicker){
        if (component==0) {
            switch (row) {
                case 0:
                    return @"18";
                    break;
                case 1:
                    return @"25";
                    break;
                case 2:
                    return @"30";
                    break;
                case 3:
                    return @"40";
                    break;
                case 4:
                    return @"50";
                    break;
            }
        }
    }
    return 0;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _genderPickerResult=[self pickerView:_genderPicker titleForRow:row forComponent:component];
    _agePickerResult=[self pickerView:_agePicker titleForRow:row forComponent:component];
}
-(NSManagedObjectContext *)managedObjectContext{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
-(IBAction)signUpAction:(id)sender{
    if ([_passwordTextField.text isEqualToString:_confirmPasswordTextField.text]) {
        BSDBManager* dbManager = [BSDBManager sharedInstance];
        AppDelegate * appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
        NSArray *usersArray=[dbManager getEntityData:@"User"];
        NSInteger greatingUserID = [usersArray count]+1;
        NSNumberFormatter *formatter= [[NSNumberFormatter alloc]init];
        formatter.numberStyle=NSNumberFormatterDecimalStyle;
        NSNumber *ageNumber=[formatter numberFromString:_agePickerResult];
        NSManagedObjectContext *context = [self managedObjectContext];
        NSManagedObject *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        [newUser setValue:_emailTextField.text forKey:@"email"];
        [newUser setValue:_passwordTextField.text forKey:@"password"];
        [newUser setValue:_firstNameTextField.text forKey:@"firstname"];
        [newUser setValue:_lastNameTextField.text forKey:@"lastname"];
        [newUser setValue:_genderPickerResult forKey:@"gender"];
        [newUser setValue:ageNumber  forKey:@"age"];
        [newUser setValue:[NSNumber numberWithInteger:greatingUserID] forKey:@"userID"];
        NSError *error = nil;
        _createdUser=[dbManager getUserFromDB:_emailTextField.text];
        appDelegate.aplicationUser=_createdUser;
        [self performSegueWithIdentifier:@"signedUp" sender:self];
        
        if (![context save:&error]) {
            NSLog(@"Can't save! %@ %@", error,[error localizedDescription]);
        }
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Attention" message:@"Password and Confirm password doesn't match" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPat{
    [_emailTextField resignFirstResponder];
    [_lastNameTextField resignFirstResponder];
    [_firstNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    [_confirmPasswordTextField resignFirstResponder];
}

@end

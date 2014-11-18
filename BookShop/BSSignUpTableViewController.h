//
//  SignUpTableViewController.h
//  BookShop
//
//  Created by FanLee on 13.11.14.
//  Copyright (c) 2014 Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSSignUpTableViewController : UITableViewController<UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic,strong) IBOutlet UITextField *firstNameTextField;
@property (nonatomic,strong) IBOutlet UITextField *lastNameTextField;
@property (nonatomic,strong) IBOutlet UITextField *emailTextField;
@property (nonatomic,strong) IBOutlet UITextField *passwordTextField;
@property (nonatomic,strong) IBOutlet UITextField *confirmPasswordTextField;
@property (nonatomic,strong) IBOutlet UIPickerView *genderPicker;
@property (nonatomic,strong) IBOutlet UIPickerView *agePicker;
@property(nonatomic,strong)NSArray *ageArray;
-(IBAction)signUpAction:(id)sender;


@end
